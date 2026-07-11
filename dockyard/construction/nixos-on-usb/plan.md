# NixOS on USB — Entwicklungsplan

Persistentes NixOS-System auf USB-Stick. Bootet überall, speichert Daten dauerhaft.
Der Stick wird wie eine Festplatte behandelt — kein Live-ISO, echte Installation.

## Projektstruktur (Ziel)

```
nixos-on-usb/
├── plan.md            # dieser Plan
├── flake.nix          # Flake-Einstiegspunkt
├── configuration.nix  # Systemkonfiguration
├── hardware.nix       # USB-spezifisches (Bootloader, Dateisysteme)
└── install.sh         # Script: USB partitionieren + nixos-install
```

## Phase 1 — Projektstruktur [ ]

- [ ] flake.nix anlegen
- [ ] configuration.nix anlegen
- [ ] hardware.nix anlegen
- [ ] install.sh anlegen

## Phase 2 — Systemkonfiguration [ ]

- [ ] Locale: de, Europe/Berlin, en_US.UTF-8
- [ ] Benutzer: slm mit sudo
- [ ] SSH aktivieren
- [ ] Basispakete: tmux, vim, git, nmap, zsh
- [ ] Flakes aktivieren

## Phase 3 — USB-Partitionierung [ ]

USB-Stick Layout:
```
Part 1: EFI   (512MB, FAT32)
Part 2: Root  (Rest,  ext4)
```

- [ ] install.sh: USB partitionieren (sgdisk/parted)
- [ ] install.sh: formatieren (mkfs.fat, mkfs.ext4)
- [ ] install.sh: mounten nach /mnt
- [ ] install.sh: nixos-install aufrufen

Bootloader: GRUB (UEFI + BIOS Legacy) — läuft auf möglichst vielen Maschinen.

## Phase 4 — Build & Install-Workflow [ ]

```sh
# USB-Stick partitionieren und NixOS installieren
sudo bash install.sh /dev/sdX
```

- [ ] Workflow dokumentieren
- [ ] install.sh testen

## Phase 5 — Test [ ]

- [ ] In VM testen (QEMU mit USB-Image als Disk)
- [ ] Auf echtem USB-Stick installieren und booten
