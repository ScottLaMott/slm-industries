#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BUNDLES=(base minecraft nixos-demo gui papermc)

die() { echo "Fehler: $*" >&2; exit 1; }

[[ $EUID -eq 0 ]] || die "Als root ausführen (sudo ./install.sh)"

# Ziel-Gerät wählen
echo ""
echo "Verfügbare Block-Geräte:"
lsblk -o NAME,SIZE,TYPE,MODEL
echo ""
read -rp "Ziel-Gerät (z.B. /dev/sdb): " DEVICE
[[ -b "$DEVICE" ]] || die "Gerät $DEVICE nicht gefunden"

# Bundle wählen
echo ""
echo "Verfügbare Bundles:"
for i in "${!BUNDLES[@]}"; do
  echo "  [$i] usb-${BUNDLES[$i]}"
done
echo ""
read -rp "Bundle-Nummer: " BUNDLE_IDX
[[ "$BUNDLE_IDX" =~ ^[0-9]+$ ]] && [[ "$BUNDLE_IDX" -lt "${#BUNDLES[@]}" ]] \
  || die "Ungültige Auswahl: '$BUNDLE_IDX' (gültig: 0-$((${#BUNDLES[@]}-1)))"
BUNDLE="${BUNDLES[$BUNDLE_IDX]}"

# Partition-Helper (sdX1/sdX2 vs nvme0n1p1/p2)
part() {
  if [[ "$DEVICE" == *nvme* || "$DEVICE" == *mmcblk* ]]; then
    echo "${DEVICE}p${1}"
  else
    echo "${DEVICE}${1}"
  fi
}

# Bestätigung
echo ""
echo "ACHTUNG: $DEVICE wird vollständig gelöscht!"
echo "Bundle: usb-${BUNDLE}"
echo ""
read -rp "Fortfahren? [j/N] " CONFIRM
[[ "${CONFIRM,,}" == "j" ]] || die "Abgebrochen"

# Partitionieren
echo ""
echo "==> Partitioniere $DEVICE ..."
sgdisk --zap-all "$DEVICE"
sgdisk -n 1:0:+512M -t 1:ef00 -c 1:"USB_EFI"  "$DEVICE"
sgdisk -n 2:0:0     -t 2:8300 -c 2:"USB_ROOT" "$DEVICE"
partprobe "$DEVICE"
sleep 1

# Formatieren
echo "==> Formatiere Partitionen ..."
mkfs.fat -F32 -n USB_EFI  "$(part 1)"
mkfs.ext4 -L  USB_ROOT    "$(part 2)"

# Cleanup bei Fehler
cleanup() {
  echo "Fehler aufgetreten — mounte aus ..." >&2
  umount /mnt/boot 2>/dev/null || true
  umount /mnt 2>/dev/null || true
}
trap cleanup ERR

# Mounten
echo "==> Mounte nach /mnt ..."
mount "$(part 2)" /mnt
mkdir -p /mnt/boot
mount "$(part 1)" /mnt/boot

# Konfiguration auf den Stick kopieren (ohne VM-Artefakte)
echo "==> Kopiere Konfiguration nach /mnt/etc/nixos ..."
mkdir -p /mnt/etc/nixos
rsync -a --exclude='*.qcow2' --exclude='result' --exclude='result-*' \
  "${SCRIPT_DIR}/" /mnt/etc/nixos/

# Installieren
echo "==> Installiere usb-${BUNDLE} ..."
nixos-install --flake "/mnt/etc/nixos#usb-${BUNDLE}" --root /mnt --no-channel-copy

echo ""
echo "Fertig! Auf dem Stick: sudo nixos-rebuild switch --flake /etc/nixos#usb-${BUNDLE}"
echo "USB-Stick kann entfernt werden."
