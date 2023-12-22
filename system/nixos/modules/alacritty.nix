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
      font.x = 0;
      font.y = 2;
      window.opacity = 0.8;
      window.padding.x = 0;
      window.padding.y = 0;
      # window.padding.x = 8;
      # window.padding.y = 3;
      cursor.style.shape = "Underline";
      cursor.style.blinking = "Always";
      cursor.blink_interval = 150;
      cursor.blink_timeout = 3;
    };
  };
}
