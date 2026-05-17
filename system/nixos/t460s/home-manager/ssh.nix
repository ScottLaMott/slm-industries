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
    matchBlocks."github.com" = {
      hostname = "ssh.github.com";
      port = 443;
    };
  };
}
