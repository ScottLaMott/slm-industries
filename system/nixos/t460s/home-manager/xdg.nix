#----------------------------------------------------------
#---
#--- xdg configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  xdg = {
    enable = true;

    configFile."awesome/rc.lua".source   = ../dots/awesome/rc.lua;
    configFile."vim/settings.vim".source = ../dots/vim/settings.vim;
    configFile."vim/maps.vim".source     = ../dots/vim/maps.vim;
    configFile."zsh/slm-zshrc".source    = ../dots/zsh/slm-zshrc;
    configFile."zsh/slm-colored-man-pages".source = ../dots/zsh/slm-colored-man-pages;
    
    configFile."yazi/yazi.toml".source   = ../dots/yazi/yazi.toml;
  };

}
