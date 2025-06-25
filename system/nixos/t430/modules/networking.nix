#----------------------------------------------------------
#---
#--- networking configuration
#---

{ pkgs, ... }: {
  networking = {
    networkmanager.enable = true;
    hostName = "t430-github";
    extraHosts = ''
      # ubuntu-container
      10.151.127.10   ubuntu-23-04
      10.151.127.101  u-1
      10.151.127.102  u-2
      10.151.127.109  u-23-10
      10.151.127.70   u-23-10-nng
      10.151.127.111  u-ansible
      10.151.127.112  u-tmux
      10.151.127.113  u-zplug
      # enterprise-container
      10.151.127.200  enterprise-v-0-1
      10.151.127.201  et-1
      10.151.127.202  et-2
      # alpine containers
      10.151.127.120  alpine
      10.151.127.130  alpine-test
      10.151.127.131  a-1
      10.151.127.132  a-2
    '';
  };
}
