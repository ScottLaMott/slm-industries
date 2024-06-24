
let
  # nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

  pkgs.mkShell {
    packages = with pkgs; [
      # working
      wezterm

      # faulty working
      konsole

      # not working
      alacritty
      kitty
      lukesmithxyz-st
      st
      tabby
      wezterm
      xterm

      # FIXME:
      # rxvt
      rxvt-unicode

      #
      yazi zsh
    ];

    shellHook = ''
      clear
      echo
      figlet -w200 '    . . . terminal  -  shell . . .'
      # toilet -f future '    . . . terminal  -  shell . . .'
      echo
      echo
    '';
  }
