#--- environment configuration / NixOS
{ config, lib, pkgs, ... }: {

  #--- completion for system packages
  environment.pathsToLink = [ "/share/zsh" ];

  #--- add zsh to /etc/shells
  environment.shells = with pkgs; [ zsh ];

  #--- list installed packages system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    acpi alacritty ansible
    bat brave brightnessctl btop
    curl
    dmenu
    ethtool exa
    feh fd file fzf
    firefox
    git
    htop
    iftop inxi ipcalc iptraf-ng
    killall
    lsd lua lua52Packages.luarocks-nix lxd
    man-db mutt
    nmap neofetch neovim nodejs
    pciutils pulsemixer pure-prompt python
    ranger ripgrep rofi
    screen silver-searcher speedtest-cli sshpass stow sxiv
    tshark tcpdump tig tio toilet tree tldr
    wget
    xclip
    unzip usbutils
    vim
    wget
    zathura zellij zip unzip
  ];

}
