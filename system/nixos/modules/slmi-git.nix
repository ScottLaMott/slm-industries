#--- git configuration / home-manager
{ config, lib, pkgs, modulesPath, ... }: {

  programs.git = {
    enable = true;
    userName = "Scott LaMott";
    userEmail = "slm@slmi-vm";
    aliases = {
      s = "status";
    };
  };

}