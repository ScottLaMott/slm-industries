#----------------------------------------------------------
#---
#--- rofi configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.rofi = {
    enable=true;
    package = pkgs.rofi;
    terminal="alacritty";
   
    # theme="sidebar";
    theme="fancy2";
    # theme="arthur";
    # theme="Indego";
    # theme="Paper";
    # theme="Monokai";
  };

}
