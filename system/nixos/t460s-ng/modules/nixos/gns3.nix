#----------------------------------------------------------
#---
#--- gns3 configuration
#---

{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    gns3-server
    gns3-gui
    ubridge
    vpcs
  ];

  services.gns3-server = { enable=false; };

}

