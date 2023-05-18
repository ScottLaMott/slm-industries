## TODO First ------------------------------------------------
- alacritty
  - in Home-Manager integrieren (alacritty.yml)
- nix-build testen, symlink fehler
- NAS in Betrieb nehmen
- vim und zsh (conf ohne home-manager) extra configs einchecken oder im Home-Manager verwalten.
- FIXME symlink hardware-configuration.nix auf slmi-hardware-configuration.nix ist workaround. Ohne den Link Fehler bei 'nixos-rebuild\`
  - Installation starten
- zsh-completion checken, z.B. bei systemctl, journalctl usw.
#### TODO ----------------------------------------------------
- Transparence (alacritty)
- *LICHTORGEL*
## DONE ------------------------------------------------------
- zsh color-theme-chooser installiert, github-read.me
- eigene Paketmodule gebaut
  - Module werden in *configuration.nix* importiert, 'imports\`-Aufruf in HomeManager und in Systemconfiguration.
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
- rofi installiert
- luarocks installiert
- vim-obsession installiert
- rofi in .config/awesome/rc.lua konfiguriert
- alacritty
  - in ~/.config/alacritty symlink auf ~/ws/slm-industries/system/extra-config/alacritty/alacritty.yml
  - github-repo mit themes in .config/alacritty clonen
- Installation auf Bare Metal
  - Installations USB-Stick erstellt
  - Laptop (t460s), in /dev/sda6 mit uefi boot installiert
