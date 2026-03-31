#--- environment configuration / NixOS
{ pkgs, ... }: {

#--- completion for system packages
  environment = {
    pathsToLink = [ "/share/zsh" ];

    #--- add zsh to /etc/shells
    shells = with pkgs; [ zsh ];

    #--- list installed packages system profile. To search, run: $ nix search wget
    systemPackages = with pkgs; [
      abcde
      acpi
      alacritty
      ansible
      bat
      bc
      bitwarden-desktop
      bitwarden-cli
      bucklespring
      brave
      brightnessctl
      btop
      curl
      cachix
      #--- def
      devbox
      dmenu
      drawing
      duf
      ethtool
      eza
      fastfetch
      feh
      fd
      file
      fzf
      #--- ghi
      gcc
      git
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
      nix-inspect
      nmap
      # neovim
      nodejs
      openssh
      #--- pqr
      pciutils
      pulseaudioFull
      pulsemixer
      pure-prompt
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
      xhost
      xeyes
      #--- yz
      zathura

      #--- test
      prismlauncher
      zip
      unzip
      # picom-jonaburg
      # spotify
    ];
  };

}
