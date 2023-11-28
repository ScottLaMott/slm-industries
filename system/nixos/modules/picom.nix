#----------------------------------------------------------
#---
#--- picom configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  services.picom = {
    enable = true;
    fade = true;
    shadow = true;
  };

}
