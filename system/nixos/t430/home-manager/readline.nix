#----------------------------------------------------------
#---
#--- readline configuration / home-manager
#---

#{ config, lib, pkgs, modulesPath,
{
  ...
}: {
  programs.readline = {
    enable = true;
    extraConfig = ''

      #----------------------------------------------------------
      # extraConfig declared in readline.nix
      #

      set editing-mode vi
    '';

  };
}
