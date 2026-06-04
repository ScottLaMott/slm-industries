# TODO: t460s

## Offen

### Konfiguration / Bereinigung

- [x] `configuration.nix:127` — `programs.ssh.forwardX11 = true` entfernen oder auf `false` setzen (setzt ForwardX11 yes in `/etc/ssh/ssh_config`, Warnung beim git push)
- [x] `zsh.nix` — EDITOR-Konflikt beheben: `sessionVariables.EDITOR = "vim"` UND `envExtra: EDITOR=nvim` gesetzt (doppelt, widersprüchlich)
- [x] `zsh.nix` — hardcodierte nvim-Pfade: Absicht, zeigen auf lokale Builds in `~/ws/projects/neovim/` (nvf + vanilla)
- [x] `git.nix` — `core.editor` hardcodiert: Absicht, lokaler nvf-Build in `~/ws/projects/neovim/nvf/result/bin/nvim`
- [x] `home-manager/tlp.nix` — Datei existiert, wird aber in `home.nix` nicht importiert (toter Code, entfernen oder einbinden)
- [x] `zsh.nix` — libvirt-Aliases (`virsh`, `virt-viewer`, `virt-manager`) obwohl `virtualisation.libvirtd.enable = false`

### Tmux

- [x] `tmux.nix` — weather-Plugin: leerer `extraConfig`-Block mit FIXME-Kommentar bereinigen
- [x] `tmux.nix` — continuum: auskommentiertes `status-right` mit FIXME-Kommentar klären

### Nix / Flake

- [x] `flake.lock` — regelmäßig aktualisieren (`nix flake update`)
- [ ] Flake-Struktur auf Snowfall Lib migrieren (Angleichung an t460s-ng, langfristig)

### E-Mail / neomutt

- [ ] **neomutt: pass-Setup abschließen** — nach `nixos-rebuild switch`:
  1. `gpg --gen-key`
  2. `pass init <gpg-email>`
  3. `pass insert email/gmail` (neues Gmail-Passwort eintragen)
  4. neomutt testen
- [ ] **Gmail-Passwort ändern** — altes Passwort war im öffentlichen GitHub-Repo (`myaccount.google.com → Sicherheit → Passwort`)

### Dotfiles

- [x] `dots/awesome/rc.lua` — Konfiguration prüfen und ggf. anpassen

## Erledigt

- [x] X11-Forwarding clientseitig deaktivieren: `home-manager/ssh.nix` mit `extraOptions.ForwardX11 = "no"` angelegt und in `home.nix` importiert
- [x] X11-Forwarding serverseitig deaktivieren: `programs.ssh.forwardX11 = false` und `enableDefaultConfig = false` in `ssh.nix`
- [x] EDITOR-Konflikt behoben: `sessionVariables.EDITOR = "nvim"`, Duplikat aus `envExtra` entfernt
