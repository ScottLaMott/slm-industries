
let
  # nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

  pkgs.mkShell {
    name = "slm-tmux-shell";
    packages = with pkgs; [
      tmux
      #
      yazi zsh
    ];

    shellHook = ''
      clear
      echo
      figlet -w120 '    . . . slm  -  tumx  -  shell . . .'
      echo
      echo
    '';
  }
