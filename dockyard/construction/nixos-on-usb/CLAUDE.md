# nixos-on-usb

Persistentes NixOS auf USB-Stick mit wählbaren Bundles. Kein Live-ISO — echte Installation, läuft wie eine Festplatte.

## Projektstruktur

```
flake.nix          # nixosConfigurations (usb-base, usb-minecraft, usb-nixos-demo, usb-gui)
install.sh         # Interaktives Install-Script für echten USB-Stick
modules/
  base.nix         # Gemeinsame Basis: locale, user slm, SSH, zsh, font, VM-Einstellungen
  hardware.nix     # systemd-boot, USB-Kernelmodule, Dateisysteme by-label
bundles/
  minecraft-server.nix
  nixos-demo.nix
  nixos-gui.nix
```

## Bundles

| Name             | Inhalt                                              |
|------------------|-----------------------------------------------------|
| `usb-base`       | Basis: slm, SSH, zsh, tmux, vim, git               |
| `usb-minecraft`  | + Minecraft-Server (Port 25565)                     |
| `usb-nixos-demo` | + fastfetch, nix-tree, Netzwerk-Tools, MOTD, figlet |
| `usb-gui`        | + AwesomeWM + LightDM + alacritty + firefox         |

## VM-Test (QEMU)

```bash
# VM bauen
nixos-rebuild build-vm --flake .#usb-base

# VM starten (Fenster, kein Fullscreen — Auflösung 1024x768, korrekte Proportionen)
./result/bin/run-usb-vm

# Login: slm / nixos
```

**Hinweis:** Vor dem ersten Start nach einem Rebuild die alte Disk löschen:
```bash
rm -f usb.qcow2
```
Sonst startet die VM mit dem alten System (QEMU cached das Image).

## Konfiguration im laufenden VM ändern

Das Projektverzeichnis ist im VM unter `/etc/nixos` gemountet (9p virtio shared directory).
Änderungen in `/etc/nixos` im VM wirken sich direkt auf den Host aus — es ist dasselbe Verzeichnis.

```bash
# Im VM: Konfiguration editieren
vim /etc/nixos/modules/base.nix

# Im VM: System neu bauen und aktivieren
sudo nixos-rebuild switch --flake /etc/nixos#usb-base
```

Alternativ auf dem Host editieren, dann im VM `nixos-rebuild switch` ausführen.
Kernel- und Bootloader-Änderungen erfordern einen VM-Neustart.

## Auf echten USB-Stick installieren

```bash
sudo ./install.sh
```

Das Script:
1. Zeigt verfügbare Block-Geräte (`lsblk`)
2. Fragt nach Ziel-Gerät (z.B. `/dev/sdb`)
3. Fragt nach Bundle-Auswahl
4. Partitioniert: EFI 512MB (FAT32, Label `USB_EFI`) + Root Rest (ext4, Label `USB_ROOT`)
5. Kopiert Konfiguration nach `/mnt/etc/nixos`
6. Führt `nixos-install` aus

Nach der Installation auf dem Stick:
```bash
sudo nixos-rebuild switch --flake /etc/nixos#usb-<bundle>
```

## Neues Bundle hinzufügen

1. Datei unter `bundles/mein-bundle.nix` anlegen
2. In `flake.nix` eintragen: `usb-mein-bundle = mkUsb [./bundles/mein-bundle.nix];`
3. In `install.sh` zur `BUNDLES`-Liste hinzufügen

## Wichtige Details

- **Bootloader:** systemd-boot mit `canTouchEfiVariables = false` — nötig für USB-Portabilität
- **Dateisysteme:** by-label (`USB_EFI`, `USB_ROOT`) — gerätunabhängig
- **Unfree Pakete:** pro Bundle mit `nixpkgs.config.allowUnfreePredicate` erlauben (siehe minecraft-server.nix)
- **Konsolen-Font:** spleen-8x16 — gut lesbar im 1024x768 VM-Fenster
- **nixpkgs:** `nixos-26.05`
