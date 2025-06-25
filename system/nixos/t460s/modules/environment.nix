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
    bc
    bucklespring
    brave
    brightnessctl
    btop
    curl
    cachix
    #--- def
    devbox
    dmenu
    duf
    ethtool
    eza
    feh
    fd
    file
    fzf
    #--- ghi
    gcc
    gitAndTools.gitFull
    glxinfo
    gnome-keyring
    gnumake
    htop
    iftop
    incus
    inxi
    ipcalc
    iptraf-ng
    #--- kjl
    killall
    lazygit
    lf
    libguestfs
    libsecret 
    libsixel
    lsd
    lua
    lua52Packages.luarocks-nix
    lukesmithxyz-st
    luarocks
    # lxd-lts
    #--- mno
    man-db
    mutt
    nix-tree
    nmap
    neofetch
    # neovim
    nodejs
    openssh
    #--- pqr
    pciutils
    pulseaudioFull
    pulsemixer
    pure-prompt
    python3Full
    qemu
    ranger
    ripgrep
    #--- stu
    screen
    silver-searcher
    speedtest-cli
    sshpass
    stylua
    sxiv
    tcpdump
    termshark
    tig
    tio
    tmux-xpanes
    tldr
    tlp
    toilet
    tree
    tshark
    wget
    usbutils
    #--- vwx
    virt-manager
    virt-top
    virt-viewer
    wavemon
    wget
    xclip
    xorg.xhost
    xorg.xeyes
    #--- yz
    zathura

    #--- test
    zip
    unzip
    # picom-jonaburg
    # spotify
  ];

}
