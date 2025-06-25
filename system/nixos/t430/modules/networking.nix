#----------------------------------------------------------
#---
#--- networking configuration
#---

{ pkgs, ... }: {
  networking = {
   
    networkmanager.enable = true;
    hostName = "t430";
    nftables.enable = true;
    
    firewall.interfaces.incusbr0.allowedTCPPorts = [
      53
      67
    ];
    firewall.interfaces.incusbr0.allowedUDPPorts = [
      53
      67
    ];
   
    extraHosts = ''
      # enterprise-container
    '';
  };
}
