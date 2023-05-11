#---------------------------------------------------
# slm@slm-industries.xyz
#
# configuration.nix / System Configuration für slmi-vm
#
#---------------------------------------------------

{ config, pkgs, ... }: {

imports =
  [ #--- Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./modules/slmi-tmux.nix
      <home-manager/nixos>
  ];

  #--- bootloader
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  system = {
    #--- This value determines the NixOS release from which the default settings for stateful data were taken
    stateVersion = "22.11";
    copySystemConfiguration = true;
  };

  #--- networking
  networking = {
    hostName = "slmi-vm";
    networkmanager.enable = true;
  };

  #--- filesysem
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };
  };

  #--- set time zone
  time.timeZone = "Europe/Berlin";

  #--- select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #keyMap = "de";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  #--- fonts
  fonts.fonts = with pkgs; [
    font-awesome
  ];

  #--- enable the OpenSSH daemon.
  services.openssh.enable = true;

  #--- enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "de";
    resolutions = [ { x = 1600; y = 900; } ];
    windowManager.awesome.enable = true;  #--- enable window manager
    displayManager.lightdm.enable = true; #--- enable login manager
    xkbOptions = "caps:escape";           #--- map caps to escape
  };

  #--- add zsh to /etc/shells
  environment.shells = with pkgs; [ zsh ];

  #--- list installed packages system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    alacritty
    bat brave btop
    curl
    dmenu
    fd file fzf
    git
    htop
    ipcalc
    killall
    lsd lua
    nmap neofetch neovim nodejs
    pulsemixer pure-prompt python
    ranger ripgrep rofi
    screen silver-searcher speedtest-cli
    stow sxiv tshark
    tcpdump tig tio toilet tree tldr
    wget
    xclip
    zathura
    wget
    speedtest-cli
  ];

  #--- shell environment
  programs.vim.defaultEditor = true;

  #--- user accounts
  users.users.slm = {
    isNormalUser = true;
    description = "Scott LaMott";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  #--- user home-manager configuration
  home-manager.users.slm = { pkgs, ... }: {
    home.stateVersion = "22.11";
    home.packages = with pkgs;
    [
      cmatrix gdu powerline-fonts
    ];

    imports = [
      ./modules/slmi-git.nix
      ./modules/slmi-fzf.nix
      ./modules/slmi-tmux.nix
      ./modules/slmi-vim.nix
    ];

    #--- zsh configuration
    programs.zsh = {
      enable = true;
      defaultKeymap = "viins";
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      dotDir = ".config/zsh";
      shellAliases = {
        ".." = "cd ..";
        c="clear";
        cp="cp -i";
        mv="mv -i";
        rm="rm -i";
        #--- edit
        v="vim";
        n="nvim";
        #--- network
        pgo="ping -c1 -W5 www.google.com";
        p="ping -c 3 -w5";
        #--- git
        gs="git status";
        #--- ls / df
        ls="lsd";
        la="ls -la";
        ll="ls -l";
        lR="ls -lR";
        dfe="df -t ext4";    # fs-type ext4
        #--- history
        hg="history | grep ";
        #--- eyecandy hi hi
        nf="clear; neofetch";
        cm="cmatrix -u9";
        cmr="cmatrix -u9 -r";
        cct="/usr/bin/theme.sh -i2";
      };
      history = {
        save = 100000;
        size = 100000;
        path = "$XDG_DATA_HOME/zsh/history";
      };
      zplug = {
        enable = true;
        #zplugHome = ./zsh/zplug;
        #zplugHome = ./zplug-xxx;

        # FIXME FIXME FIXME ---------------------------------------
        # alle ungültig weil SHELL-Environment
        #zplugHome = ${XDG_CONFIG_HOME}/zsh/zplug;
        #zplugHome = $XDG_CONFIG_HOME/zsh/zplug;
        #zplugHome = "${XDG_CONFIG_HOME}/zsh/zplug";
        #zplugHome = "$XDG_DATA_HOME/zsh/zplug";
        #zplugHome = $XDG_DATA_HOME/zsh;
        #zplugHome = $XDG_CONFIG_HOME/zsh;
        #zplugHome = "$XDG_CONFIG_HOME/zsh/zplug";

        #zplugHome = "${config.xdg.dataHome}/zsh/zplug";
        #zplugHome = "${config.xdg.configHome}/zsh/zplug";
        #zplugHome = $config.xdg.dataHome/zsh/zplug;
        #zplugHome = ${config.xdg.dataHome}/zsh/zplug;
        # FIXME FIXME FIXME ---------------------------------------

        plugins = [
          { name = "hlissner/zsh-autopair"; tags = [ defer:2 ]; }
          # { name = "zsh-users/zsh-autosuggestions"; tags = [ defer:2 ]; ?? on:"zsh-users/zsh-completions" ?? }
        ];
      };
      initExtra = ''
        #----------------------------------------------------------
        # declared by configuration.nix / slm
        #

        # own new slm-zshrc
        [ -f  $XDG_CONFIG_HOME/zsh/slm-zshrc ]                && source $XDG_CONFIG_HOME/zsh/slm-zshrc
        [ -f  $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages ]  && source $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages

        export LESS='-j5 -R'
        #----------------------------------------------------------
      '';
    }; #--- zsh configuration end

    #--- xdg configuration
    xdg = {
      enable = true;
    }; #--- xdg configuration

  }; #--- user home-manager configuration end

}

