{pkgs, lib, ...}: {
  imports = [./nixos-gui.nix];

  networking.hostName = lib.mkForce "usb-prismlauncher";

  environment.systemPackages = with pkgs; [
    prismlauncher
  ];
}
