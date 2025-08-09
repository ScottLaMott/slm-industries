#----------------------------------------------------------
#---
#--- xdg configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  xdg = {
    enable = true;

    configFile."awesome".enable = true;
    configFile."awesome".source = ../dots/awesome/rc.lua;
    configFile."awesome".target = "awesome/rc.lua";

    configFile."vim-settings".enable = true;
    configFile."vim-settings".source = ../dots/vim/settings.vim;
    configFile."vim-settings".target = "vim/settings.vim";

    configFile."vim-maps".enable = true;
    configFile."vim-maps".source = ../dots/vim/maps.vim;
    configFile."vim-maps".target = "vim/maps.vim";
    
    configFile."zsh".enable = true;
    configFile."zsh".source = ../dots/zsh/slm-zshrc;
    configFile."zsh".target = "zsh/zshrc";
    
    configFile."zsh-slm-colored-man-pages".source = ../dots/zsh/slm-colored-man-pages;
    
    configFile."yazi".enable   = true;
    configFile."yazi".source   = ../dots/yazi/yazi.toml;
    configFile."yazi".target   = "../yazi/yazi.toml";
   
    #-- not following xdg standart
    configFile."tcl".enable   = true;
    configFile."tcl".source   = ../dots/tcl/tclshrc;
    configFile."tcl".target   = "../.tclshrc";
  
    configFile."input".enable   = true;
    configFile."input".text   = "set editing-mode vi";
    configFile."input".target   = "../.inputrc";
  
  };

}
