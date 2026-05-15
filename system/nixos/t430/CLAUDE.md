# T430 NixOS-Konfiguration

## Ansatz: Kein Flake

- Home Manager wird als NixOS-Modul eingebunden (`<home-manager/nixos>`)
- Kanal: `nixos-unstable` (NixOS 26.05 / Yarara)
- Kanalupdate: `sudo nix-channel --upgrade`
- `system.stateVersion = "24.11"`

## Hardware

- Auflösung: 1600×900
- Bootloader: GRUB, Legacy/BIOS (`/dev/sda`)
- Bluetooth aktiviert

## Apply-Befehl

```sh
sudo nixos-rebuild switch   # NOPASSWD für slm konfiguriert
sudo nixos-rebuild test
```

## Aktivierte Dienste / Features

- Virtualisierung: incus + libvirtd
- SSH (PasswordAuthentication an, X11Forwarding an)
- GNOME Keyring (für git-push / Credential-Handling)
- Spotify: `spotifyd` vorhanden aber deaktiviert

## Bekannte Eigenheiten

- `hlissner/zsh-autopair` funktioniert nicht (verursacht Probleme mit History-Suche `/`)
- Cachix noch nicht konfiguriert
- Spotify-Credentials stehen im Klartext in der Konfiguration (TODO: beheben)

## Struktur

```
configuration.nix        # Haupt-Systemkonfiguration
hardware-configuration.nix
home-manager/            # Home Manager Module (alacritty, tmux, zsh, vim, ...)
modules/                 # NixOS-Module (environment, fonts, networking, tlp)
dots/                    # Rohe Dotfiles (awesome, vim, yazi, zsh)
```
