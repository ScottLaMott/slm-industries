#----------------------------------------------------------
#---
#--- alacritty configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.alacritty = {
    enable = true;
    #--- themes
    # theme = "alacritty_0_12"; 
    # theme = "terafox"; 
    # theme = "dracula"; 
    # theme = "dark_pride"; 
    # theme = "tokyo_night"; 
    # theme = "ubuntu"; 
    # theme = "kanagawa_dragon"; 
    theme = "kanagawa_wave"; 
    # theme = "kimbie_dark"; 
    # theme = "wombat"; 
    # theme = "seashells"; 
    # theme = "smoooooth"; 
    # theme = "terminal_app"; 
    # theme = "solarized_osaka"; 
    # theme = "one_dark"; theme = "one_light"; 
    # theme = "papercolor_dark"; 
    # theme = "github_dark_high_contrast"; theme = "github_dark"; theme = "github_light"; theme = "gruvbox_dark";
    # theme = "dark_pride"; theme = "moonfly"; theme = "rainbow"; 
    #--- settings
    settings = {
      font.size = 9;
      # font.x = 0;
      # font.y = 2;

      # window.opacity = 0.0;
      # window.opacity = 0.3;
      # window.opacity = 0.7;
      # window.opacity = 0.8;
      window.opacity = 0.9;
      # window.opacity = 1.0;

      window.padding.x = 0;
      window.padding.y = 0;
      # window.padding.x = 8;
      # window.padding.y = 3;

      # cursor.style.shape = "Underline";
      cursor.style.shape = "Block";
      cursor.style.blinking = "Always";
      cursor.blink_interval = 150;
      cursor.blink_timeout = 3;
    };
  };
}
