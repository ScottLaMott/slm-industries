# TODO: t460s

## Offen

### Konfiguration / Bereinigung

- [x] `configuration.nix:127` — `programs.ssh.forwardX11 = true` entfernen oder auf `false` setzen (setzt ForwardX11 yes in `/etc/ssh/ssh_config`, Warnung beim git push)
- [x] `zsh.nix` — EDITOR-Konflikt beheben: `sessionVariables.EDITOR = "vim"` UND `envExtra: EDITOR=nvim` gesetzt (doppelt, widersprüchlich)
- [ ] `zsh.nix` — hardcodierte nvim-Pfade entfernen: `nvim`- und `prismlauncher`-Aliases zeigen auf `/home/slm/ws/projects/...` statt auf Nix-verwaltete Pfade
- [ ] `git.nix` — `core.editor` hardcodiert auf `/home/slm/ws/projects/neovim/nvf/result/bin/nvim`, sollte Nix-Paket referenzieren
- [x] `home-manager/tlp.nix` — Datei existiert, wird aber in `home.nix` nicht importiert (toter Code, entfernen oder einbinden)
- [ ] `zsh.nix` — libvirt-Aliases (`virsh`, `virt-viewer`, `virt-manager`) obwohl `virtualisation.libvirtd.enable = false`

### Tmux

- [x] `tmux.nix` — weather-Plugin: leerer `extraConfig`-Block mit FIXME-Kommentar bereinigen
- [ ] `tmux.nix` — continuum: auskommentiertes `status-right` mit FIXME-Kommentar klären

### Nix / Flake

- [ ] `flake.lock` — regelmäßig aktualisieren (`nix flake update`)
- [ ] Flake-Struktur auf Snowfall Lib migrieren (Angleichung an t460s-ng, langfristig)

### Dotfiles

- [ ] `dots/awesome/rc.lua` — Konfiguration prüfen und ggf. anpassen

## Erledigt

- [x] X11-Forwarding clientseitig deaktivieren: `home-manager/ssh.nix` mit `extraOptions.ForwardX11 = "no"` angelegt und in `home.nix` importiert
- [x] X11-Forwarding serverseitig deaktivieren: `programs.ssh.forwardX11 = false` und `enableDefaultConfig = false` in `ssh.nix`
- [x] EDITOR-Konflikt behoben: `sessionVariables.EDITOR = "nvim"`, Duplikat aus `envExtra` entfernt
