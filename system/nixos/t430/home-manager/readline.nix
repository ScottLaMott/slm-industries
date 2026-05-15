#----------------------------------------------------------
#---
#--- readline configuration / home-manager
#---

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
