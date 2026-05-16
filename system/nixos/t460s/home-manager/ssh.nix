#----------------------------------------------------------
#---
#--- ssh configuration / home-manager
#---

{ ... }: {
  programs.ssh = {
    enable = true;
    matchBlocks."*" = {
      extraOptions.ForwardX11 = "no";
    };
  };
}
