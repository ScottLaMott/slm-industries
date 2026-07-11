# NixOS on USB — Entwicklungsplan

Persistentes NixOS-System auf USB-Stick mit wählbaren Software-Bundles.
Der Stick wird wie eine Festplatte behandelt — kein Live-ISO, echte Installation.
Beim Installieren wird ein Bundle gewählt das auf den Stick installiert wird.

## Projektstruktur (Ziel)

```
nixos-on-usb/
├── plan.md                  # dieser Plan
├── flake.nix                # Flake mit allen nixosConfigurations
├── install.sh               # Script: USB partitionieren + Bundle wählen + nixos-install
├── modules/
│   └── base.nix             # gemeinsame Basis (slm, SSH, zsh, locale, ...)
└── bundles/
    ├── minecraft-server.nix # Minecraft-Server Bundle
    ├── nixos-demo.nix       # minimales Demo/Showcase-System
    └── nixos-gui.nix        # NixOS mit Desktop (AwesomeWM)
```

## Bundles

| Bundle            | Inhalt                              |
|-------------------|-------------------------------------|
| `usb-base`        | Basis: slm, SSH, zsh, tmux, vim, git |
| `usb-minecraft`   | + Minecraft-Server                  |
| `usb-nixos-demo`  | + Demo-System (minimal, showcase)   |
| `usb-gui`         | + AwesomeWM Desktop                 |

Neue Bundles können jederzeit als `.nix`-Datei unter `bundles/` hinzugefügt werden.

## Phase 1 — Projektstruktur [ ]

- [ ] flake.nix anlegen (mit allen nixosConfigurations)
- [ ] modules/base.nix anlegen (gemeinsame Basis)
- [ ] bundles/minecraft-server.nix anlegen
- [ ] bundles/nixos-demo.nix anlegen
- [ ] bundles/nixos-gui.nix anlegen
- [ ] hardware.nix anlegen (Bootloader, Dateisysteme)
- [ ] install.sh anlegen

## Phase 2 — Basis-Konfiguration [ ]

`modules/base.nix`:
- [ ] Locale: de, Europe/Berlin, en_US.UTF-8
- [ ] Benutzer: slm mit sudo
- [ ] SSH aktivieren
- [ ] Basispakete: tmux, vim, git, nmap, zsh
- [ ] Flakes aktivieren

## Phase 3 — Bundles implementieren [ ]

- [ ] minecraft-server.nix: Minecraft-Server-Dienst
- [ ] nixos-demo.nix: minimale Showcasekonfiguration
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

Bootloader: GRUB (UEFI + BIOS Legacy) — läuft auf möglichst vielen Maschinen.

## Phase 5 — Test [ ]

- [ ] Basis-Bundle in VM testen (QEMU)
- [ ] GUI-Bundle in VM testen
- [ ] Auf echtem USB-Stick installieren und booten
