# nixos-on-usb

Persistentes NixOS auf USB-Stick mit wählbaren Bundles. Kein Live-ISO — echte Installation, läuft wie eine Festplatte.

## Projektstruktur

```
flake.nix          # nixosConfigurations (usb-base, usb-minecraft, usb-nixos-demo, usb-gui, usb-papermc, usb-prismlauncher)
install.sh         # Interaktives Install-Script für echten USB-Stick
modules/
  base.nix         # Gemeinsame Basis: locale, user slm, SSH, zsh, font, VM-Einstellungen
  hardware.nix     # systemd-boot, USB-Kernelmodule, Dateisysteme by-label, WiFi-Firmware
bundles/
  minecraft-server.nix
  papermc-server.nix
  nixos-demo.nix
  nixos-gui.nix
  gui-prismlauncher.nix
```

## Bundles

| Name                  | Inhalt                                                      |
|-----------------------|-------------------------------------------------------------|
| `usb-base`            | Basis: slm, SSH, zsh, tmux, neovim, git                    |
| `usb-minecraft`       | + Minecraft-Server (Port 25565)                             |
| `usb-papermc`         | + PaperMC Server (Port 25565)                               |
| `usb-nixos-demo`      | + fastfetch, nix-tree, Netzwerk-Tools, MOTD, figlet         |
| `usb-gui`             | + AwesomeWM + LightDM + alacritty + firefox + NetworkManager + Bluetooth |
| `usb-prismlauncher`   | + GUI + PrismLauncher + PaperMC (lokal), Autologin als `mc`             |

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

Das Projektverzeichnis ist im VM unter `/etc/nixos` gemountet (9p virtio, **read-only aus VM-Sicht**).
Dateien können nur auf dem **Host** editiert werden.

```bash
# 1. Auf dem Host editieren (normaler Editor)

# 2. Im VM: Cache leeren damit Änderungen sichtbar werden
echo 3 | sudo tee /proc/sys/vm/drop_caches

# 3. Im VM: System neu bauen und aktivieren
sudo nixos-rebuild switch --flake /etc/nixos#usb-base
```

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
- **Bluetooth:** alle GUI-Bundles — blueman, powerOnBoot; pairen mit `bluetoothctl`
- **prismlauncher:** User `mc` (Autologin), PrismLauncher Autostart via `.xprofile`, Offline-Account voreingerichtet, PaperMC auf localhost:25565
