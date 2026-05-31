{
  description = "t460s-next-generation";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/d233902339c02a9c334e7e593de68855ad26c4cb"; # last working commit before awesome build break
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      # url = "github:nix-community/home-manager/master";
      # url = "github:nix-community/home-manager/release-26.05";
      url = "github:nix-community/home-manager/master";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:ScottLaMott/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvf, nix-index-database, ... }@inputs: {
  # outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.t460s = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.slm = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
        # workaround: awesome 4.3 generate-examples fails with lgi/cairo on nixos-unstable
        {
          nixpkgs.overlays = [
            (final: prev: {
              awesome = prev.awesome.overrideAttrs (old: {
                cmakeFlags = (old.cmakeFlags or []) ++ [ "-DGENERATE_DOC=OFF" ];
                preConfigure = (old.preConfigure or "") + ''
                  sed -i '/add_dependencies.*check-examples/d' CMakeLists.txt
                '';
              });
            })
          ];
        }
        # slm ???
        # nvf.nixosModules.default
        nvf.nixosModules.nvf
        nix-index-database.nixosModules.default
        # nix-index-database.nixosModules.nix-index-with-db
      ];
    };
  };

}
