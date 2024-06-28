
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

  pkgs.mkShell {
    name = "terminal-nix-shell";
    packages = with pkgs; [
      alacritty
      cool-retro-term
      kitty
      konsole
      lukesmithxyz-st
      # rxvt
      # rxvt-unicode
      st
      tabby
      wezterm
      ### xterm
      xterm
      xorg.xlsfonts xorg.xfd xorg.xfontsel
      #
      zsh
    ];

    shellHook = ''
      clear
      echo
      figlet -w120 '    . . . terminal  -  shell . . .'
      # toilet -w120 -f future '    . . . terminal  -  shell . . .'
      echo
      echo
    '';
  }
