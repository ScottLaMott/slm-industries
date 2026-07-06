# T460s Systembeschreibung

## Maschine

- **Gerät:** Lenovo ThinkPad T460s
- **Architektur:** x86_64-linux
- **CPU:** Intel (KVM-fähig, Microcode-Updates aktiviert)
- **Auflösung:** 1920×1080
- **Dateisystem:** ext4 (`/`), ext4 (`/mnt/data`), vfat (`/boot/efi`)
- **Swap:** keiner

## NixOS-Konfiguration

- **Ansatz:** Manuell strukturiertes Flake (kein Snowfall)
- **nixpkgs:** `nixos-26.05`
- **stateVersion:** `23.05`
- **Bootloader:** systemd-boot, UEFI (`/boot/efi`)
- **Hostname:** `t460s`

## Flake Inputs

| Input | Quelle |
|-------|--------|
| nixpkgs | `nixos-26.05` |
| home-manager | `release-26.05` |
| nvf | `github:ScottLaMott/nvf` (persönlicher Fork) |
| nix-index-database | `github:Mic92/nix-index-database` |

## Desktop / Oberfläche

- **Window Manager:** AwesomeWM
- **Display Manager:** LightDM
- **Tastaturlayout:** Deutsch (`de`), Caps Lock → Escape
- **Standard-Dateimanager:** PCManFM

## Sound

- **System:** Pipewire (PulseAudio deaktiviert)
- **ALSA:** aktiviert (32-Bit-Support)
- **JACK:** aktiviert
- **RTKit:** aktiviert

## Netzwerk

- **Manager:** NetworkManager
- **Firewall:** nftables
- **Incus-Bridge:** DNS/DHCP-Ports (53, 67) freigegeben

## Dienste

| Dienst | Details |
|--------|---------|
| OpenSSH | PasswordAuthentication an, X11Forwarding an |
| GNOME Keyring | aktiviert (für Git-Authentifizierung) |
| Bluetooth | aktiviert |
| Wireshark | aktiviert, Benutzer `slm` in Gruppe `wireshark` |
| nix-ld | aktiviert (für nicht-gepackte dynamisch gelinkte Binaries) |
| nix-index-database | als NixOS-Modul (`nix-index-with-db`) |
| Cachix | nix-community |

## Virtualisierung

- **Incus:** aktiviert (LXC/LXD-Nachfolger)
- **libvirtd:** deaktiviert

## Minecraft Server

| Server | Port | Typ |
|--------|------|-----|
| Server 1 | 25565 | deklarativ via `services.minecraft-server` |
| Server 2 | 25566 | custom systemd-Service mit eigenem JAR |

Server 2 läuft mit `-Xmx4096M -Xms2048M` und ist mit systemd-Hardening abgesichert.

## GNS3

- `gns3-server`, `gns3-gui`, `ubridge`, `vpcs`, `dynamips` installiert (via Home Manager)
- systemd-Service aktuell deaktiviert

## Neovim

- **Framework:** nvf (persönlicher Fork `github:ScottLaMott/nvf`)
- Als NixOS-Modul eingebunden (`programs.nvf.enable = true`)

## Shell & Terminal

- **Shell:** zsh
- **Terminal:** Alacritty
- **Multiplexer:** tmux (Nord-Theme), tmuxp für Sessions
- **Prompt:** Starship

## Home Manager Module

alacritty, cava, fzf, git, neomutt, picom, readline, rofi, ssh, starship, tmux, vim, xdg, xsession, yazi, zoxide, zsh, pass

## Wichtige Pakete (Auswahl)

- **Entwicklung:** gcc, gnumake, python3, lua, ansible, devbox, nix-tree, lazygit
- **Netzwerk:** nmap, wireshark, termshark, tshark, tcpdump, iftop, iptraf-ng
- **System:** btop, htop, atop, inxi, acpi, brightnessctl, tlp
- **Dateien:** eza, bat, fd, ripgrep, fzf, yazi, lf, ranger, zoxide
- **Medien:** strawberry, mixxx, spotify-player, beets, picard, playerctl
- **Misc:** claude-code, github-cli, lazygit, tig, tmux-xpanes, zathura

## Benutzer

- **Name:** slm (Scott LaMott)
- **Gruppen:** networkmanager, wheel, wireshark, lxd, jackaudio, libvirt, incus-admin, minecraft, kvm
- **Shell:** zsh

## Sicherheit

- `sudo` timestamp_timeout: 60 Minuten, global (für Claude CLI)
- nftables Firewall aktiv

## Apply-Befehl

```sh
sudo nixos-rebuild switch --flake .#t460s
```
