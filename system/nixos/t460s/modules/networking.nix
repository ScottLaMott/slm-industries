#----------------------------------------------------------
#---
#--- networking configuration
#---

{ config, pkgs, ... }: {

  networking = {
   
    networkmanager.enable = true;
    hostName = "t460";
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
