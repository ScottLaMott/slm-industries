
let
  # nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

  pkgs.mkShell {
    packages = with pkgs; [
      # pipx install radio-active
      pipx
      #
      yazi zsh
    ];

    shellHook = ''
      clear
      echo
      figlet -w200 '    . . . radio-active  -  shell . . .'
      echo
    '';
  }
