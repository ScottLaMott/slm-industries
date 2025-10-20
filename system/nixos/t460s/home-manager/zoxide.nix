#----------------------------------------------------------
#---
#--- zoxide configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

}
