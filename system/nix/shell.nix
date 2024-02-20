
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

  pkgs.mkShell {
    packages = with pkgs; [
      cmatrix
      figlet
      sl
      tio
    ];

    GIT_EDITOR = "${pkgs.neovim}/bin/nvim";

    shellHook = ''
      clear
      echo
      echo
      toilet -f future 'slm-industries . . .'
      echo
      git status
      echo
      acpi
      # tmux
    '';
  }
