# NixOS-Konfigurationen

Dieses Verzeichnis enthält drei NixOS-Systemkonfigurationen für verschiedene ThinkPad-Maschinen.

## Maschinen

| Verzeichnis | Maschine | Ansatz | Status |
|-------------|----------|--------|--------|
| `t430/` | ThinkPad T430 | Kein Flake, nix-channel | Aktiv |
| `t460s/` | ThinkPad T460s | Flake (manuell strukturiert) | Legacy |
| `t460s-ng/` | ThinkPad T460s | Flake mit Snowfall Lib | New Generation |

## Gemeinsame Konventionen

- **Formatter:** `alejandra` (nicht `nixfmt`)
- **Tastaturlayout:** Deutsch (`de`), Caps Lock → Escape
- **Window Manager:** AwesomeWM + LightDM
- **Shell:** zsh
- **Sound:** Pipewire (PulseAudio deaktiviert)
- **Zeitzone:** `Europe/Berlin`
- **Locale:** `en_US.UTF-8`
- **nvf:** persönlicher Fork `github:ScottLaMott/nvf`

## Verzeichnisstruktur (pro Maschine)

```
<maschine>/
├── dots/          # Rohe Dotfiles (awesome, vim, yazi, zsh, ...)
├── home-manager/  # Home Manager Module (t430, t460s)
├── modules/       # NixOS-Module (environment, fonts, networking, tlp, ...)
└── flake.nix      # Nur t460s und t460s-ng
```

Bei `t460s-ng` weicht die Struktur ab (Snowfall-Konvention):
```
t460s-ng/
├── systems/x86_64-linux/t460s-ng/   # NixOS-Systemkonfiguration
├── homes/x86_64-linux/slm@t460s-ng/ # Home Manager Konfiguration
├── modules/nixos/                   # NixOS-Module
└── modules/home/                    # Home Manager Module
```

## Apply-Befehle

```sh
# t430 (kein Flake)
sudo nixos-rebuild switch

# t460s (Flake)
sudo nixos-rebuild switch --flake .#t460s

# t460s-ng (Snowfall Flake)
sudo nixos-rebuild switch --flake .#t460s-ng
```
