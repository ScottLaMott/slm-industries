### TODO

- Installation auf Bare Metal
  - Installations USB-Stich
  - Laptop (t460s) partitionieren
  - Installation starten
- NAS in Betrieb nehmen
- vim und zsh (conf ohne home-manager) extra configs einchecken oder im Home-Manager verwalten.
- rofi installieren


- symlink hardware-configuration.nix auf slmi-hardware-configuration.nix ist workaround. Ohne den Link Fehler bei 'nixos-rebuild`
- nix-build testen, symlink fehler

### DONE
- zsh color-theme-chooser installiert
- Paketmodule gebaut
  - Module werden in _*configuration.nix*_ importiert, 'imports`-Aufruf in HomeManager und in Systemconfiguration.
  ```
  > ls -lR modules
  total 24
  -rw-r--r-- 1 slm users  496 May 12 20:07 slmi-fzf.nix
  -rw-r--r-- 1 slm users  233 May 12 20:08 slmi-git.nix
  -rw-r--r-- 1 slm users  584 May 12 20:08 slmi-tmux.nix
  -rw-r--r-- 1 slm users  901 May 12 20:07 slmi-vim.nix
  -rw-r--r-- 1 slm users  119 May 12 20:07 slmi-xdg.nix
  -rw-r--r-- 1 slm users 2540 May 12 20:07 slmi-zsh.nix
  ```
- git Fehler, immer wieder rebase !!! FIXME
  - Lösung
    - beim editieren aufpassen, gleichzeitiges aendern in verschiedenen vim-sessions

