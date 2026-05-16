#----------------------------------------------------------
#---
#--- ssh configuration / home-manager
#---

{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      extraOptions.ForwardX11 = "no";
    };
  };
}
