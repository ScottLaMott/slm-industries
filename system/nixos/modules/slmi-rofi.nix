#----------------------------------------------------------
#---
#--- git configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.rofi = {
    enable=true;

    theme="/home/slm/.config/rofi/launchers/type-slm/style-slm.rasi";
    # theme="/home/slm/.config/rofi/launchers/type-7/style-9.rasi";

    terminal="alacritty";
    extraConfig  = {
      location = 1;
      xoffset  = 20;
      yoffset  = 0;
      display-window      = "window > ";
      display-windowcd    = "windowcd > ";
      display-run         = "run > ";
      display-ssh         = "ssh > ";
      display-drun        = "drun > ";
      display-combi       = "combi > " ;
      display-keys        = "keys > " ;
      display-filebrowser = "filebrowser > ";
    };
    configPath="/home/slm/.config/rofi/config.rasi";
  };

}

