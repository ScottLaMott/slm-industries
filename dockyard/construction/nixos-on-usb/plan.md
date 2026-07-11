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

- [x] flake.nix anlegen (nixosConfigurations + packages/diskImages via nixos-generators)
- [x] modules/base.nix anlegen (gemeinsame Basis)
- [x] modules/hardware.nix anlegen (Bootloader, Dateisysteme by-label)
- [x] bundles/minecraft-server.nix anlegen
- [x] bundles/nixos-demo.nix anlegen
- [x] bundles/nixos-gui.nix anlegen
- [x] install.sh anlegen

## Phase 2 — Basis-Konfiguration [ ]

`modules/base.nix`:
- [ ] Locale: de, Europe/Berlin, en_US.UTF-8
- [ ] Benutzer: slm mit sudo
- [ ] SSH aktivieren
- [ ] Basispakete: tmux, vim, git, nmap, zsh
- [ ] Flakes aktivieren

## Phase 3 — Bundles implementieren [ ]

- [ ] minecraft-server.nix: Minecraft-Server-Dienst + Port 25565
- [ ] nixos-demo.nix: drei Bereiche:
  - NixOS-Showcase: neofetch, nix repl, CLI-Tools
  - Präsentation: MOTD, cowsay/figlet-Begrüßung beim Login
  - Netzwerk-Demo: nmap, curl, tcpdump, iperf3
- [ ] nixos-gui.nix: AwesomeWM + LightDM (wie auf den ThinkPads)

## Phase 4 — USB-Partitionierung & Install-Script [ ]

USB-Stick Layout:
```
Part 1: EFI   (512MB, FAT32)
Part 2: Root  (Rest,  ext4)
```

install.sh:
- [ ] Bundle-Auswahl (interaktives Menü)
- [ ] USB partitionieren (sgdisk/parted)
- [ ] formatieren (mkfs.fat, mkfs.ext4)
- [ ] mounten nach /mnt
- [ ] nixos-install --flake .#<bundle> aufrufen

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

- [ ] Basis-Bundle in VM testen (QEMU)
- [ ] GUI-Bundle in VM testen
- [ ] Auf echtem USB-Stick installieren und booten
