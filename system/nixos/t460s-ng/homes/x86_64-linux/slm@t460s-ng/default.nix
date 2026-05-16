#---
#--- homes/x86_64-linux/slm@t460s-ng/default.nix
#---
{ config, lib, pkgs, ... }: {

  imports = [ ../../../modules/home/xdg.nix ];

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    atop
    figlet
    flameshot
    glow
    gdu
    hwinfo
    nitch
    nix-tree
    picom
    powerline-fonts
    rofi
    theme-sh
    beets
    mixxx
    picard
    playerctl
    soco-cli
    spotify-player
    starship
    strawberry
    cubiomes-viewer
    prismlauncher
    lnav
    devbox
    gns3-server
    gns3-gui
    ubridge
    vpcs
    dynamips
  ];

  # imports nicht nötig – Snowfall lädt modules/home/ automatisch
}
