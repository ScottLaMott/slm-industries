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
    # bitwarden-cli
    brave
    brightnessctl
    btop
    bucklespring
    curl
    cachix
    #--- def
    devbox
    dmenu
    drawing
    duf
    ethtool
    eza
    feh
    fd
    file
    fzf
    #--- ghi
    gcc
    gimp
    gitFull
    mesa-demos
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
    libreoffice
    libsecret 
    libsixel
    libvirt
    lsd
    lua
    lua52Packages.luarocks-nix
    lukesmithxyz-st
    luarocks
    # lxd-lts
    #--- mno
    man-db
    manix
    nix-inspect
    nix-tree
    nmap
    fastfetch
    # neovim
    # nodejs
    openssh
    #--- pqr
    pciutils
    pulseaudioFull
    pulsemixer
    pure-prompt
    python3
    qemu
    ranger
    ripgrep
    rlwrap
    #--- stu
    screen
    silver-searcher
    speedtest-cli
    sshpass
    stylua
    sxiv
    tcl
    tclreadline
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
    wireshark
    wget
    usbutils
    #--- vwx
    virt-manager
    virt-top
    virt-viewer
    # wavemon
    wget
    # xclip
    # xorg.xhost
    x11_ssh_askpass
    # xorg.xeyes
    #--- yz
    zathura

    #--- test
    lunar-client
    zip
    unzip
    # picom-jonaburg
    # spotify
    nautilus
    pcmanfm
    # gns3
    # gns3-server
    # gns3-gui
    # ubridge
    # vpcs
    # dynamips
  ];

}
