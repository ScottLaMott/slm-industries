{
  description = "NixOS on USB — persistentes NixOS mit wählbaren Bundles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  }: let
    system = "x86_64-linux";

    mkUsb = modules:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {configPath = toString ./.;};
        modules = [
          ./modules/base.nix
          ./modules/hardware.nix
          ./modules/home-slm.nix
          home-manager.nixosModules.home-manager
        ] ++ modules;
      };
  in {
    nixosConfigurations = {
      usb-base = mkUsb [];
      usb-minecraft = mkUsb [./bundles/minecraft-server.nix];
      usb-nixos-demo = mkUsb [./bundles/nixos-demo.nix];
      usb-gui = mkUsb [./bundles/nixos-gui.nix];
      usb-papermc = mkUsb [./bundles/papermc-server.nix];
      usb-prismlauncher = mkUsb [./bundles/gui-prismlauncher.nix];
    };

    # Phase 4b: diskImage-Outputs werden hier ergänzt
    # packages.x86_64-linux.usb-*-image via image.repart
  };
}
