#----------------------------------------------------------
#---
#--- cava configuration / home-manager
#---

{ config, 
  lib, 
  pkgs, 
  modulesPath, 
  ... 
  }: {

  programs.cava = {
    enable = true;
    settings = {
      # output.orientation = "top"; geht nur in speziellem output mode 
      output.waveform = 0;
      color = {
        # background = "'#000000'";
        background = "'#FFFFFF'";    # white
        
        # foreground = "'#000000'";    # black
        # foreground = "'#FFFFFF'";
        # foreground = "'#00b359'";
        foreground = "'#FFFF00'";    # yello
        # foreground = "'#33FF33'";    # green
      };
    };
  };
}
