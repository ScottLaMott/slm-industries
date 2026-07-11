{
  description = "NixOS on USB — persistentes NixOS mit wählbaren Bundles";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";

    mkUsb = modules:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [./modules/base.nix ./modules/hardware.nix] ++ modules;
      };
  in {
    nixosConfigurations = {
      usb-base = mkUsb [];
      usb-minecraft = mkUsb [./bundles/minecraft-server.nix];
      usb-nixos-demo = mkUsb [./bundles/nixos-demo.nix];
      usb-gui = mkUsb [./bundles/nixos-gui.nix];
    };

    # Phase 4b: diskImage-Outputs werden hier ergänzt
    # packages.x86_64-linux.usb-*-image via image.repart
  };
}
