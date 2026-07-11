# NixOS on USB — Entwicklungsplan

Persistentes NixOS-System auf USB-Stick mit wählbaren Software-Bundles.
Der Stick wird wie eine Festplatte behandelt — kein Live-ISO, echte Installation.
Beim Installieren wird ein Bundle gewählt das auf den Stick installiert wird.

## Projektstruktur (Ziel)

```
nixos-on-usb/
├── plan.md                  # dieser Plan
├── flake.nix                # Flake mit nixosConfigurations + packages (diskImages)
├── install.sh               # Script: USB partitionieren + Bundle wählen + nixos-install
├── modules/
│   ├── base.nix             # gemeinsame Basis (slm, SSH, zsh, locale, ...)
│   └── hardware.nix         # Bootloader, Dateisysteme (by-label)
└── bundles/
    ├── minecraft-server.nix # Minecraft-Server Bundle
    ├── nixos-demo.nix       # Demo/Showcase-System
    └── nixos-gui.nix        # NixOS mit Desktop (AwesomeWM)
```

## Bundles

| Bundle            | Inhalt                              |
|-------------------|-------------------------------------|
| `usb-base`        | Basis: slm, SSH, zsh, tmux, vim, git |
| `usb-minecraft`   | + Minecraft-Server                  |
| `usb-nixos-demo`  | + Demo-System (NixOS-Showcase, Präsentation, Netzwerk) |
| `usb-gui`         | + AwesomeWM Desktop                 |

Neue Bundles können jederzeit als `.nix`-Datei unter `bundles/` hinzugefügt werden.

## Phase 1 — Projektstruktur [x]

- [x] flake.nix anlegen (nixosConfigurations, diskImage-Output kommt in Phase 4b)
- [x] modules/base.nix anlegen (gemeinsame Basis)
- [x] modules/hardware.nix anlegen (Bootloader, Dateisysteme by-label)
- [x] bundles/minecraft-server.nix anlegen
- [x] bundles/nixos-demo.nix anlegen
- [x] bundles/nixos-gui.nix anlegen
- [x] install.sh anlegen

## Phase 2 — Basis-Konfiguration [x]

`modules/base.nix`:
- [x] Locale: de, Europe/Berlin, en_US.UTF-8
- [x] Konsolentastatur: de (console.keyMap)
- [x] Benutzer: slm mit sudo (passwordless)
- [x] SSH aktivieren
- [x] Basispakete: tmux, vim, git, nmap, wget, curl, zsh
- [x] Flakes aktivieren

## Phase 3 — Bundles implementieren [x]

- [x] minecraft-server.nix: Minecraft-Server-Dienst + Port 25565 (openFirewall)
- [x] nixos-demo.nix: drei Bereiche:
  - NixOS-Showcase: neofetch, nix-tree
  - Präsentation: MOTD, figlet/lolcat-Begrüßung beim Login
  - Netzwerk-Demo: nmap, curl, tcpdump, iperf3, traceroute, whois
- [x] nixos-gui.nix: AwesomeWM + LightDM, deutsches Keyboard

## Phase 4 — USB-Partitionierung & Install-Script [x]

USB-Stick Layout:
```
Part 1: EFI   (512MB, FAT32, Label: USB_EFI)
Part 2: Root  (Rest,  ext4,  Label: USB_ROOT)
```

install.sh:
- [x] Bundle-Auswahl (interaktives Menü)
- [x] USB partitionieren (sgdisk)
- [x] formatieren (mkfs.fat, mkfs.ext4)
- [x] mounten nach /mnt
- [x] nixos-install --flake .#<bundle> aufrufen

Bootloader: systemd-boot (`canTouchEfiVariables = false` — wichtig für USB).

## Phase 4b — diskImage Output [ ]

Alternativ zu nixos-install: fertiges Image bauen und per dd flashen.
Kein extra Flake-Input nötig — nutzt `image.repart` (nixpkgs-intern, systemd-repart).

```bash
nix build .#usb-minecraft-image
dd if=result/image.raw of=/dev/sdX bs=4M status=progress
resize2fs /dev/sdXp2       # Root-Partition auf volle Stick-Größe ausdehnen
```

- [ ] modules/image.nix anlegen (image.repart Partitionslayout: ESP + Root)
- [ ] packages.x86_64-linux.usb-*-image für jedes Bundle exponieren

## Phase 5 — Test [ ]

- [x] Basis-Bundle in VM testen (QEMU) — Tastatur, Login, zsh ok
- [ ] Demo-Bundle in VM testen
- [ ] GUI-Bundle in VM testen
- [ ] Auf echtem USB-Stick installieren und booten
