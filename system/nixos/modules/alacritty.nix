#----------------------------------------------------------
#---
#--- alacritty configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.alacritty = {
    enable = true;
    #--- settings
    settings = {
      font.size = 9;
      window.opacity = 0.9;
      window.padding.x = 8;
    };
  };
}
