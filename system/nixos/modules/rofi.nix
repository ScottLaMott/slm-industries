#----------------------------------------------------------
#---
#--- rofi configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.rofi = {
    enable=true;
    terminal="alacritty";
    extraConfig  = {
      location = 1;
      xoffset  = 20;
      yoffset  = 0;
    };
    # configPath="/home/slm/.config/rofi/config.rasi";
    # theme="/home/slm/.config/rofi/launchers/type-slm/style-slm.rasi";
    theme="/home/slm/.config/rofi/launchers/type-4/style-3.rasi";
  };

}

