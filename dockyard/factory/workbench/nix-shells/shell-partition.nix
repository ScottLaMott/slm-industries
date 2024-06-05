
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

  pkgs.mkShell {
    packages = with pkgs; [
      gparted
      parted
      sl
      zsh
    ];

    GIT_EDITOR = "${pkgs.neovim}/bin/nvim";

    shellHook = ''
      clear
      echo
      echo
      toilet -f future '    . . . partition-shell . . .'
      echo
      git status
      echo
      acpi
    '';
  }
