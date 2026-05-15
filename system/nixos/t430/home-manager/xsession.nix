#----------------------------------------------------------
#---
#--- xsession / awesome wm / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  xsession.windowManager.awesome = {
    enable = true;
  };

}
