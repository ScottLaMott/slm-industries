#----------------------------------------------------------
#---
#--- picom configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  services.picom = {
    enable  = true;
    backend = "glx";
    fade    = true;
    shadow  = true;
    vSync   = true;

    settings.blur = {
        method = "dual_kawase";
        size = 3;
        deviation = 5.0;
    };
    settings.fade-delta    = 10;
    settings.corner-radius = 10;
    settings.rounded-corners-exclude = [
        "_NET_WM_WINDOW_TYPE@[0]:a = '_NET_WM_WINDOW_TYPE_DOCK'"
    ];
  };

}
