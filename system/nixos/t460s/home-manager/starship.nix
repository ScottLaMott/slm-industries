#----------------------------------------------------------
#---
#--- starship configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.starship = {
    enable = true;
  };

}
