#----------------------------------------------------------
#---
#--- git configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.rofi = {
    enable=true;
    theme="sidebar";
    terminal="alacritty";
    # extraConfig  = {
    #   location = 1;
    #   xoffset  = 20;
    #   yoffset  = 0;
    #   display-window      = "window > ";
    #   display-windowcd    = "windowcd > ";
    #   display-run         = "run > ";
    #   display-ssh         = "ssh > ";
    #   display-drun        = "drun > ";
    #   display-combi       = "combi > " ;
    #   display-keys        = "keys > " ;
    #   display-filebrowser = "filebrowser > ";
    # };
    configPath="$XDG_CONFIG_HOME/rofi/config.rasi";
  };

}


