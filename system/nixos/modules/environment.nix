#--- environment configuration / NixOS
{ config, lib, pkgs, ... }: {

  #--- completion for system packages
  environment.pathsToLink = [ "/share/zsh" ];

  #--- add zsh to /etc/shells
  environment.shells = with pkgs; [ zsh ];

  #--- list installed packages system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    abcde
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
    eza
    feh
    fd
    file
    fzf
    git
    glxinfo
    guestfs-tools
    htop
    iftop
    inxi
    ipcalc
    iptraf-ng
    killall
    lf
    libguestfs
    libsixel
    lsd
    lua
    lua52Packages.luarocks-nix
    lukesmithxyz-st
    lxd
    man-db
    nix-tree
    nmap
    mutt
    neofetch
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
    usbutils
    vim
    virt-manager
    virt-top
    virt-viewer
    wget
    xorg.xhost
    xorg.xeyes
    zathura
    zip
    unzip
    # picom-jonaburg
  ];

}
