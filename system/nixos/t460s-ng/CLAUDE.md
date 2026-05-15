# T460s-NG NixOS-Konfiguration (New Generation)

Dies ist die Weiterentwicklung von `t460s/`, mit Snowfall Lib als Flake-Struktur. Wurde mit Unterstützung von Claude erstellt.

## Ansatz: Flake mit Snowfall Lib

- nixpkgs: `nixos-unstable`
- Snowfall Lib: auto-discovery von `systems/`, `homes/`, `modules/`
- Home Manager über Snowfall integriert
- nvf-Integration: `github:ScottLaMott/nvf`
- Namespace: `slm` (eigene Pakete/Module erreichbar als `pkgs.slm.*`)
- `system.stateVersion = "23.05"`

## Snowfall-Konvention (wichtig!)

Snowfall lädt Verzeichnisse automatisch — keine manuellen `imports` nötig:

- `systems/x86_64-linux/t460s-ng/` → NixOS-Systemkonfiguration
- `homes/x86_64-linux/slm@t460s-ng/` → Home Manager für Benutzer `slm`
- `modules/nixos/` → NixOS-Module (werden allen Systemen hinzugefügt)
- `modules/home/` → Home Manager Module (werden allen Homes hinzugefügt)

## Hardware

- Auflösung: 1920×1080
- Bootloader: systemd-boot, UEFI (`/boot/efi`)
- Bluetooth aktiviert

## Apply-Befehl

```sh
sudo nixos-rebuild switch --flake .#t460s-ng
```

## Aktivierte Dienste / Features

- Virtualisierung: incus + nftables (kein libvirtd)
- SSH (PasswordAuthentication an, X11Forwarding an)
- GNOME Keyring
- nvf als NixOS-Modul und Home Manager-Modul
- nix-ld
- Wireshark
- GNS3 (Server + GUI)
- Minecraft Server (Port 25565)
- Cachix: nix-community

## Besonderheiten

- Beim ersten Login wird eine Passwortänderung erzwungen (`chage -d 0 slm`)
- `networking.nftables.enable = true` (wegen incus)
- Der Hostname `t460s-ng` ist noch nicht final gesetzt (siehe readme.slm.md)
