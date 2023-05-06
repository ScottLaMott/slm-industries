#---------------------------------------------------
# slm@slm-industries.xyz
#
# configuration.nix / System Configuration für slmi-vm
#
#---------------------------------------------------

{ config, pkgs, ... }: {

imports =
  [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data were taken
  system.stateVersion = "22.11";

  #--- bootloader
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  #--- networking
  networking = {
    hostName = "slmi-vm"; # Define your hostname.
    # enable networking
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
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
  };

  # Configure keymap in X11 FIXME
  #services.xserver.xkbOptions = {
    # "eurosign:e";
  #  "caps:escape"; # map caps to escape.
  #};

  #--- list installed packages system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    alacritty
    bat brave btop
    curl
    dmenu
    fd file fzf
    #fd file font-awesome_4 fzf
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
    tcpdump tig toilet tree tldr
    wget
    xclip
    zathura
    wget
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
      gdu powerline-fonts
      # xdg-user-dirs
    ];
    xdg = { enable = true; };
    #--- zsh configuration
    programs.zsh = {
      enable = true;
      defaultKeymap = "viins";
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      dotDir = ".config/zsh";
      shellAliases = { };              # aliase, ausgelagert, see slm-aliases
      history = {
        save = 100000;
        size = 100000;
        path = "$XDG_DATA_HOME/zsh/history";
      };
      zplug = {
        enable = true;
        zplugHome = ./zsh/zplug;
        #zplugHome = ${XDG_CONFIG_HOME}/zsh/zplug;
        plugins = [
          { name = "hlissner/zsh-autopair"; tags = [ defer:2 ]; }
          # { name = "zsh-users/zsh-autosuggestions"; tags = [ defer:2 ]; ?? on:"zsh-users/zsh-completions" ?? }
        ];
      };
      initExtra = ''
        #------------------------------------------------------------------------
        # declared in home.nix with programs.zsh.initExtra / slm
        #

        # own new slm-zshrc
        [ -f  $XDG_CONFIG_HOME/zsh/slm-zshrc ]                && source $XDG_CONFIG_HOME/zsh/slm-zshrc
        [ -f  $XDG_DATA_HOME/zsh/bin/slm-aliases ]            && source $XDG_DATA_HOME/zsh/bin/slm-aliases
        [ -f  $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages ]  && source $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages

        export LESS='-j5 -R'

        # remap caps to escape
        setxkbmap -option caps:escape

        #------------------------------------------------------------------------
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
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " declared in home.nix / by slm
        "
        " source slm settings
        source $XDG_CONFIG_HOME/vim/settings.vim
        " source slm mappings
        source $XDG_CONFIG_HOME/vim/maps.vim
        "
        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
     '';
    }; #--- vim configuration end
  }; #--- user home-manager configuration end

  #--- shell environment
  programs.vim.defaultEditor = true;

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
    '';
    plugins = [
      pkgs.tmuxPlugins.nord
      #pkgs.tmuxPlugins.gruvbox
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
    ];
  };

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
    font-awesome_4
  ];
}

