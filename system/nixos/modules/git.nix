#----------------------------------------------------------
#---
#--- git configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.git = {
    enable = true;
    userName = "Scott LaMott";
    userEmail = "slm@slm-industries";
    extraConfig = {
      core = { editor = "nvim"; };
    };
    aliases = {
      s = "status";
    };
  };

}
