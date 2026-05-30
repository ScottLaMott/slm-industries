# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal NixOS configuration monorepo ("slm-industries") for multiple ThinkPad machines. The primary active work is in `system/nixos/`.

## Top-Level Structure

```
system/nixos/        # NixOS configurations per machine (main work area)
system/nix/          # shell.nix for dev shell (nix-shell)
system/extra-config/ # Raw dotfiles not yet managed by Nix
dockyard/            # Docker/VM/container experiments and archives
organisation/        # Personal notes, company docs
```

## Machine Configurations (`system/nixos/`)

| Directory   | Machine        | Approach                  | Status      |
|-------------|----------------|---------------------------|-------------|
| `t430/`     | ThinkPad T430  | No flake, nix-channel     | Active      |
| `t460s/`    | ThinkPad T460s | Flake (manual structure)  | Legacy      |
| `t460s-ng/` | ThinkPad T460s | Flake + Snowfall Lib      | New Gen     |

## Apply Commands

```sh
# t430 (no flake)
sudo nixos-rebuild switch
sudo nixos-rebuild test

# t460s (flake)
sudo nixos-rebuild switch --flake .#t460s

# t460s-ng (Snowfall flake)
sudo nixos-rebuild switch --flake .#t460s-ng
```

## Common Conventions

- **Formatter:** `alejandra` (not `nixfmt`)
- **Keyboard:** German (`de`), Caps Lock → Escape
- **Window Manager:** AwesomeWM + LightDM
- **Shell:** zsh
- **Sound:** Pipewire (PulseAudio disabled)
- **Timezone/Locale:** `Europe/Berlin` / `en_US.UTF-8`
- **Neovim:** managed via `nvf` — personal fork at `github:ScottLaMott/nvf`
- **Namespace:** `slm` (custom packages/modules accessible as `pkgs.slm.*` in t460s-ng)

## t460s-ng Architecture (Snowfall Lib)

Snowfall auto-discovers directories — **no manual `imports` needed**:

```
systems/x86_64-linux/t460s-ng/   # NixOS system config
homes/x86_64-linux/slm@t460s-ng/ # Home Manager for user slm
modules/nixos/                   # NixOS modules (applied to all systems)
modules/home/                    # Home Manager modules (applied to all homes)
```

## t460s / t430 Architecture (Manual)

```
configuration.nix        # Main system config
home.nix                 # Home Manager entry point
hardware-configuration.nix
home-manager/            # Home Manager modules (alacritty, tmux, zsh, vim, ...)
modules/                 # NixOS modules (environment, fonts, networking, tlp, ...)
dots/                    # Raw dotfiles (awesome, vim, yazi, zsh, ...)
```

## Dev Shell

From the repo root:
```sh
nix-shell system/nix/shell.nix
```

## Existing CLAUDE.md Files

Each machine directory has its own `CLAUDE.md` with machine-specific details (hardware, enabled services, known quirks). Read those when working on a specific machine config.
