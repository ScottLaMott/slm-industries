# nixos-on-usb — Build-Anleitung

Persistentes NixOS auf USB-Stick mit wählbaren Bundles.
Kein Live-ISO — echte Installation, läuft wie eine Festplatte.

---

## Voraussetzungen

- NixOS mit aktivierten Flakes:
  ```nix
  nix.settings.experimental-features = ["nix-command" "flakes"];
  ```
- Werkzeuge: `sgdisk` (gdisk), `rsync`, `mkfs.fat`, `mkfs.ext4`
- Für USB-Installation: Root-Zugriff (`sudo`)

---

## Projektstruktur

```
flake.nix               # nixosConfigurations für alle Bundles
install.sh              # Interaktives Install-Script
modules/
  base.nix              # Gemeinsame Basis (User, SSH, Font, ...)
  hardware.nix          # Bootloader, Kernel-Module, Dateisysteme, Firmware
bundles/
  minecraft-server.nix   # Vanilla Minecraft Server
  papermc-server.nix     # PaperMC Server
  nixos-demo.nix         # Demo-System mit MOTD und Netzwerk-Tools
  nixos-gui.nix          # AwesomeWM Desktop + NetworkManager
  gui-prismlauncher.nix  # GUI + PrismLauncher (importiert nixos-gui.nix)
```

---

## Bundles

| Name              | Flake-Ziel            | Inhalt                                              |
|-------------------|-----------------------|-----------------------------------------------------|
| `base`            | `usb-base`            | slm, SSH, zsh, tmux, neovim, git, cmatrix           |
| `minecraft`       | `usb-minecraft`       | + Vanilla Minecraft Server (Port 25565)             |
| `papermc`         | `usb-papermc`         | + PaperMC Server (Port 25565)                       |
| `nixos-demo`      | `usb-nixos-demo`      | + fastfetch, nix-tree, Netzwerk-Tools, MOTD         |
| `gui`             | `usb-gui`             | + AwesomeWM, LightDM, Firefox, NetworkManager       |
| `prismlauncher`   | `usb-prismlauncher`   | + GUI (wie oben) + PrismLauncher (Minecraft-Client) |

---

## VM-Test (QEMU)

Vor der Installation auf echte Hardware empfiehlt sich ein VM-Test.

### 1. VM bauen

```bash
nixos-rebuild build-vm --flake .#usb-base
# oder: usb-nixos-demo, usb-gui, usb-minecraft, usb-papermc
```

### 2. Alte Disk löschen (wichtig nach Rebuild)

```bash
rm -f usb.qcow2
```

> Ohne diesen Schritt startet QEMU mit dem alten System.

### 3. VM starten

```bash
./result/bin/run-usb-base-vm
# für gui-Bundle:
./result/bin/run-usb-gui-vm
```

Login: `slm` / `nixos`

### 4. Konfiguration im laufenden VM testen

Das Projektverzeichnis ist unter `/etc/nixos` gemountet (read-only).
Änderungen nur auf dem **Host** vornehmen, dann im VM:

```bash
echo 3 | sudo tee /proc/sys/vm/drop_caches
sudo nixos-rebuild switch --flake /etc/nixos#usb-base
```

---

## Auf USB-Stick installieren

### 1. Install-Script ausführen

```bash
sudo ./install.sh
```

Das Script führt folgende Schritte aus:

1. Verfügbare Block-Geräte anzeigen (`lsblk`)
2. Ziel-Gerät wählen (z.B. `/dev/sdb`)
3. Bundle wählen
4. Bestätigung — **das Gerät wird vollständig gelöscht!**
5. Partitionieren:
   - Partition 1: EFI, 512 MB, FAT32, Label `USB_EFI`
   - Partition 2: Root, Rest, ext4, Label `USB_ROOT`
6. Konfiguration nach `/mnt/etc/nixos` kopieren
7. `nixos-install` ausführen

> Am Ende fragt `nixos-install` nach einem Root-Passwort.
> Enter drücken für kein Passwort (Login als `slm` mit `sudo` ist passwortlos).

### 2. Stick aushängen

```bash
sudo umount /mnt/boot && sudo umount /mnt
```

### 3. Booten

USB-Stick einstecken und im BIOS/UEFI als Boot-Gerät wählen.
Login: `slm` / `nixos`

---

## Konfiguration nach der Installation aktualisieren

Auf dem laufenden Stick-System:

```bash
sudo nixos-rebuild switch --flake /etc/nixos#usb-gui
```

Die Konfiguration liegt unter `/etc/nixos` auf dem Stick selbst.

---

## Neues Bundle hinzufügen

1. Datei `bundles/mein-bundle.nix` anlegen:
   ```nix
   { pkgs, ... }: {
     networking.hostName = "usb-mein-bundle";
     environment.systemPackages = with pkgs; [ ... ];
   }
   ```

2. In `flake.nix` eintragen:
   ```nix
   usb-mein-bundle = mkUsb [./bundles/mein-bundle.nix];
   ```

3. In `install.sh` zur Liste hinzufügen:
   ```bash
   BUNDLES=(base minecraft nixos-demo gui papermc mein-bundle)
   ```

4. VM-Test:
   ```bash
   nixos-rebuild build-vm --flake .#usb-mein-bundle
   rm -f usb.qcow2
   ./result/bin/run-usb-mein-bundle-vm
   ```

---

## Wichtige Details

| Thema | Detail |
|-------|--------|
| Bootloader | systemd-boot, `canTouchEfiVariables = false` für USB-Portabilität |
| Dateisysteme | by-label (`USB_EFI`, `USB_ROOT`) — gerätunabhängig |
| Konsolen-Font | spleen-8x16 — gut lesbar im 1024x768 VM-Fenster |
| WiFi-Firmware | `hardware.enableRedistributableFirmware = true` — Intel, Atheros, Realtek |
| Unfree Pakete | per Bundle mit `nixpkgs.config.allowUnfreePredicate` erlauben |
| nixpkgs | `nixos-26.05` |
| VM-Memory | 4 GB (für Minecraft/PaperMC empfohlen) |
| User | `slm`, Passwort `nixos`, passwordless sudo |
