# T460s NixOS-Konfiguration (Legacy)

Dies ist die ältere Flake-Konfiguration für den T460s. Die Weiterentwicklung findet in `t460s-ng/` statt.

## Ansatz: Manuell strukturiertes Flake

- nixpkgs: `nixos-unstable`
- Home Manager als Flake-Modul
- nvf-Integration: `github:ScottLaMott/nvf` (persönlicher Fork)
- `system.stateVersion = "23.05"`

## Hardware

- Auflösung: 1920×1080
- Bootloader: systemd-boot, UEFI (`/boot/efi`)
- Bluetooth aktiviert

## Apply-Befehl

```sh
sudo nixos-rebuild switch --flake .#t460s
```

## Aktivierte Dienste / Features

- Virtualisierung: incus (libvirtd deaktiviert)
- SSH (PasswordAuthentication an, X11Forwarding an)
- GNOME Keyring
- nvf (Neovim-Framework) als NixOS-Modul
- nix-ld (für nicht-gepackte dynamisch gelinkte Binaries)
- Wireshark (Benutzer `slm` in Gruppe `wireshark`)
- GNS3 (Server + GUI) — Netzwerksimulator
- Minecraft Server (deklarativ, Port 25565)
- Cachix: nix-community

## Struktur

```
flake.nix                # Flake-Definition
configuration.nix        # NixOS-Systemkonfiguration
home.nix                 # Home Manager Einstiegspunkt
hardware-configuration.nix
cachix.nix               # Cachix-Konfiguration
home-manager/            # Home Manager Module
modules/                 # NixOS-Module (environment, fonts, networking, tlp, gns3)
dots/                    # Rohe Dotfiles
```
