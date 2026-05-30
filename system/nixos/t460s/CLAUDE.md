# T460s NixOS-Konfiguration (Legacy)

Dies ist die ältere Flake-Konfiguration für den T460s. Die Weiterentwicklung findet in `t460s-ng/` statt.

## Ansatz: Manuell strukturiertes Flake

- nixpkgs: `nixos-unstable`
- Home Manager als Flake-Modul
- nvf-Integration: `github:ScottLaMott/nvf` (persönlicher Fork)
- nix-index-database: `github:Mic92/nix-index-database`
- `system.stateVersion = "23.05"`
- tmux-Theme: `nord`

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
- nix-index-database: als Flake-Input, NixOS-Modul (`nix-index-database.nixosModules.default`)
- Wireshark (Benutzer `slm` in Gruppe `wireshark`)
- GNS3 (Server + GUI) — Netzwerksimulator
- Minecraft Server 1 (deklarativ, Port 25565)
- Minecraft Server 2 (custom systemd service, Port 25566)
- Cachix: nix-community

## Struktur

```
flake.nix                # Flake-Definition
configuration.nix        # NixOS-Systemkonfiguration
home.nix                 # Home Manager Einstiegspunkt
hardware-configuration.nix
cachix.nix               # Cachix-Konfiguration
home-manager/            # alacritty, cava, fzf, git, neomutt, picom, readline,
                         # rofi, ssh, starship, tlp, tmux, vim, xdg, xsession,
                         # yazi, zoxide, zsh
modules/                 # NixOS-Module (environment, fonts, networking, tlp, gns3)
dots/                    # Rohe Dotfiles
```
