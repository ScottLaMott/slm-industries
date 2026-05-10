{
  # A human-readable name for this flake
  description = "t460s - claude optimized";

  inputs = {
    # Main nixpkgs channel — using unstable for latest packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Snowfall Lib: provides opinionated flake structure and helpers
    # Follows nixpkgs to avoid a duplicate nixpkgs instance
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager: manages user-level configuration (dotfiles, packages, services)
    # Follows nixpkgs to stay in sync with the system nixpkgs
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nvf: a Neovim configuration framework
    # Note: this points to a personal fork — consider switching to
    # github:NotAShelf/nvf for upstream updates
    nvf = {
      url = "github:ScottLaMott/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;

      # Root of the flake's source tree — Snowfall uses this to find
      # systems/, homes/, modules/, packages/ etc. automatically
      src = ./.;

      snowfall = {
        # Namespace used to scope your custom packages and modules
        # Accessible as e.g. pkgs.slm.mypackage
        namespace = "slm";
      };

      channels-config = {
        # Allow packages with non-free licenses (e.g. vscode, nvidia drivers)
        allowUnfree = true;
      };

      # NixOS modules applied to all systems defined in systems/
      # Adds nvf's NixOS module so you can configure Neovim system-wide
      systems.modules.nixos = [
        inputs.nvf.nixosModules.nvf
      ];

      # Home Manager modules applied to all homes defined in homes/
      # Adds nvf's Home Manager module for per-user Neovim configuration
      homes.modules = [
        inputs.nvf.homeManagerModules.nvf
      ];
    };
}
