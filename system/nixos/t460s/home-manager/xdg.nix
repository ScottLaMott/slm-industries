#----------------------------------------------------------
#---
#--- xdg configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  xdg = {
    enable = true;

    # configHome = "/home/slm/.config";
    # configHome = lib.concatStrings [ home.homeDirectory "/.config" ]; #FIXME
    configHome = lib.concatStrings [ "/home/slm" "/.config" ];

    configFile."awesome" = {
      enable = true;
      source = ../dots/awesome/rc.lua;
      target = "awesome/rc.lua";
    };

    configFile."vim-settings" = {
      enable = true;
      source = ../dots/vim/settings.vim;
      target = "vim/settings.vim";
    };

    configFile."vim-maps" = {
      enable = true;
      source = ../dots/vim/maps.vim;
      target = "vim/maps.vim";
    };
    
    configFile."zsh" = {
      enable = true;
      source = ../dots/zsh/slm-zshrc;
      target = "zsh/slm-zshrc";
    };
    
    configFile."zsh.scmp" = {
      enable = true;
      source = ../dots/zsh/slm-colored-man-pages;
      target = "zsh/slm-colored-man-pages";
    };

    configFile."yazi" = {
      enable   = false;
      source   = ../dots/yazi/yazi.toml;
      target   = "yazi/yazi.toml";
    };
    
    #-- not following xdg standart
    
    configFile."tcl" = {
      enable   = true;
      source   = ../dots/tcl/tclshrc;
      target   = "../.tclshrc";
    };
    
  };

}
