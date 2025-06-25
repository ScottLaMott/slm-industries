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
    # theme = "dracula"; # schlecht
    # theme = "dark_pride"; 
    # theme = "tokyo_night"; 
    # theme = "ubuntu"; 
    # theme = "kanagawa_dragon"; # gut
    # theme = "kanagawa_wave"; 
    # theme = "kimbie_dark";  # gut
    # theme = "wombat"; 
    # theme = "seashells"; 
    # theme = "smoooooth"; 
    # theme = "terminal_app"; 
    # theme = "solarized_osaka"; 
    # theme = "one_dark"; theme = "one_light"; 
    # theme = "one_dark";
    # theme = "papercolor_dark"; # gut
    # theme = "github_dark_high_contrast"; theme = "github_dark"; theme = "github_light"; theme = "gruvbox_dark";
    theme = "github_dark"; # gut
    # theme = "dark_pride"; theme = "moonfly"; theme = "rainbow"; 
    #--- settings
    settings = {
      font.size = 9;
      # font.x = 0;
      # font.y = 2;

      # 0.0 full, 1.0 no opacity
      window.opacity = 0.95;

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
