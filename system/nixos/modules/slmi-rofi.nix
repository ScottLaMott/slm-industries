#----------------------------------------------------------
#---
#--- git configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.rofi = {
    enable=true;
    theme="sidebar";
    terminal="alacritty";
    configPath="$XDG_CONFIG_HOME/rofi/config.rasi";
  };

}
