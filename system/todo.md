### FIRST
- zsh-completion checken, z.B. bei systemctl, journalctl, zellij usw.
  - Kommando compinstall test, erstellt neue completions ???
- HomeManager konfigurieren
  - Fehler bei Benutzung der configuration.nix auf neuem System. Inbetriebnahme T460s
- nix-build testen, symlink fehler
- FIXME symlink hardware-configuration.nix auf slmi-hardware-configuration.nix ist workaround. Ohne den Link Fehler bei 'nixos-rebuild\`
  - Installation starten
### TODO
- zsh extra-config auslagern, dev-zsh branch benutzen !! fett
- alacritty
  - in Home-Manager integrieren (alacritty.yml)
  - ohne Fensterrahmen/-dekoration
  - Transparence
- vim (extra-config) erstellen und in git-repo verwalten
- zsh (extra-config) erstellen und in git-repo verwalten
- FritzBox/Repeater in Betrieb nehmen
- NAS in Betrieb nehmen
- *LICHTORGEL*
  - TestLO im Büro
  - adruino workbench installieren
### DONE
- zsh color-theme-chooser installiert, github-read.me
- eigene Paketmodule gebaut
  - Module werden in *configuration.nix* importiert, 'imports\`-Aufruf in HomeManager und in Systemconfiguration.
  ```
  ~> ls -lR ~/ws/slm-industries/system/nixos/modules
  total 56
  -rw-r--r-- 1 slm users 25455 May 18 10:51 slmi-alacritty.nix
  -rw-r--r-- 1 slm users   703 May 15 19:48 slmi-environment.nix
  -rw-r--r-- 1 slm users   567 May 13 23:10 slmi-fzf.nix
  -rw-r--r-- 1 slm users   304 May 13 23:10 slmi-git.nix
  -rw-r--r-- 1 slm users   675 May 17 05:22 slmi-tmux.nix
  -rw-r--r-- 1 slm users  1110 May 18 09:57 slmi-vim.nix
  -rw-r--r-- 1 slm users   190 May 13 23:10 slmi-xdg.nix
  -rw-r--r-- 1 slm users  2847 May 15 20:00 slmi-zsh.nix
  ```
- git Fehler, immer wieder rebase !!! FIXME
  - Lösung
    - beim editieren aufpassen, gleichzeitiges Ändern in verschiedenen vim-sessions
- rofi installiert
- luarocks installiert
- vim-obsession installiert, super gutes plugin
- rofi in .config/awesome/rc.lua konfiguriert
- alacritty
  - in ~/.config/alacritty symlink auf ~/ws/slm-industries/system/extra-config/alacritty/alacritty.yml
  - github-repo mit themes in .config/alacritty clonen
- Installation auf Bare Metal
  - Installations USB-Stick erstellt
  - Laptop (t460s), in /dev/sda6 mit uefi boot installiert
