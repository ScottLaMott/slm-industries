{pkgs, lib, ...}: {
  networking.hostName = "usb-papermc";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["papermc" "minecraft-server"];

  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;
    package = pkgs.papermc;
    serverProperties = {
      motd = "NixOS PaperMC";
      max-players = 20;
      difficulty = 1;
      online-mode = false;
    };
  };
}
