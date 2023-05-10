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
      <home-manager/nixos>
      # FIXME /home/slm/ws/slm-industries/organisation/company/system/slmi-tmux.nix
  ];

  #--- This value determines the NixOS release from which the
  #--- default settings for stateful data were taken
  system.stateVersion = "22.11";

  #--- bootloader
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
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

  #--- enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "de";
    resolutions = [ { x = 1600; y = 900; } ];
    windowManager.awesome.enable = true;  #--- enable window manager
    displayManager.lightdm.enable = true; #--- enable login manager
    xkbOptions = "caps:escape";           #--- map caps to escape
  };

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
      # xdg-user-dirs
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
        # declared by home-manager-modul / slm
        #

        # own new slm-zshrc
        [ -f  $XDG_CONFIG_HOME/zsh/slm-zshrc ]                && source $XDG_CONFIG_HOME/zsh/slm-zshrc
        [ -f  $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages ]  && source $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages

        export LESS='-j5 -R'
        #----------------------------------------------------------
      '';
    }; #--- zsh configuration end

    #--- vim configuration
    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        # -- colorscheme
        awesome-vim-colorschemes vim-airline vim-airline-themes
        # -- the best of the rest
        fzf-vim goyo markdown-preview-nvim limelight-vim vim-nix
        vim-startify vim-snippets vim-vinegar vim-fugitive ultisnips
      ];
      #--- settings
      settings = {
        number = true;
        relativenumber  = false;
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
      };
      extraConfig  = ''
        """""""""""""""""""""""""""""""""""""""""""""""""""""
        " declared by home-manager-modul / slm
        "
        " source slm settings
        source $XDG_CONFIG_HOME/vim/settings.vim
        " source slm mappings
        source $XDG_CONFIG_HOME/vim/maps.vim
        "
        """""""""""""""""""""""""""""""""""""""""""""""""""""
     '';
    }; #--- vim configuration end

    #--- fzf configuration
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd --type f --hidden";
      defaultOptions = [
        "--header-first"
        "--layout=reverse"
        "--height=80%"
        "--cycle"
        "--border=rounded"
        "--info=inline"
        "--prompt='fzf-> '"
        "--scroll-off=5"
        # "--preview=bat"
        ];
      changeDirWidgetCommand = "fd --type d --hidden";
    }; #--- fzf configuration

    #--- git configuration
    programs.git = {
      enable = true;
      userName = "Scott LaMott";
      userEmail = "slm@slmi-industries";
      aliases = {
        s = "status";
      };
    };

    #--- xdg configuration
    xdg = {
      enable = true;
    }; #--- xdg configuration

    #--- tmux configuration
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      escapeTime = 1;
      shortcut = "a";
      newSession = true;
      extraConfig = ''
        set-option -g status-left-length 20
        set-option -g default-terminal "screen-256color"
        TMUX_FZF_LAUNCH_KEY="C-f"        # tmux-fzf plugin c-a c-f
      '';
      plugins = [
        pkgs.tmuxPlugins.gruvbox
        pkgs.tmuxPlugins.resurrect
        pkgs.tmuxPlugins.continuum
        pkgs.tmuxPlugins.tmux-fzf
      ];
    };

  }; #--- user home-manager configuration end

  #--- shell environment
  programs.vim.defaultEditor = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # add zsh to /etc/shells
  environment.shells = with pkgs; [ zsh ];

  #--- fonts
  fonts.fonts = with pkgs; [
    font-awesome
  ];
}

