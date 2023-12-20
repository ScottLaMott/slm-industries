#--- environment configuration / NixOS
{ config, lib, pkgs, ... }: {

  #--- completion for system packages
  environment.pathsToLink = [ "/share/zsh" ];

  #--- add zsh to /etc/shells
  environment.shells = with pkgs; [ zsh ];

  #--- list installed packages system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    acpi
    alacritty
    ansible
    bat
    brave
    brightnessctl
    btop
    curl
    dmenu
    ethtool
    exa
    feh
    fd
    file
    fzf
    git
    htop
    iftop
    inxi
    ipcalc
    iptraf-ng
    killall
    lf
    libsixel
    lsd
    lua
    lua52Packages.luarocks-nix
    lukesmithxyz-st
    lxd
    man-db
    nmap
    mutt
    neofetch
    neovim
    nodejs
    openssh
    pciutils
    pulsemixer
    pure-prompt
    python
    qemu
    ranger
    ripgrep
    screen
    silver-searcher
    speedtest-cli
    sshpass
    stow
    sxiv
    tcpdump
    tig
    tio
    tmux-xpanes
    tldr
    toilet
    tree
    tshark
    wget
    xclip
    unzip
    usbutils
    vim
    wget
    xorg.xhost
    xorg.xeyes
    zathura
    zellij
    zip
    unzip
    # picom-jonaburg
  ];

}
