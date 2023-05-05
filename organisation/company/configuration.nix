#---------------------------------------------------
# slm@slm-industries.xyz
#
# configuration.nix / System Configuration für slm-industries-vm
#
#---------------------------------------------------

{ config, pkgs, ... }:

{ 

imports =
  [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
  ];

  # bootloader 
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  networking.hostName = "slmi-vm"; # Define your hostname.
  #networking.hostName = "slm-industries-vm"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #keyMap = "de";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.resolutions = [
    {
      x = 1600; y = 900;
    }
  ];
  # Enable window manager
  services.xserver.windowManager.awesome.enable = true;
  # Enable login manager
  services.xserver.displayManager.lightdm.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "de";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  #  user account for slm / Scott LaMott
  users.users.slm = {
    isNormalUser = true;
    description = "Scott LaMott";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager.users.slm = { pkgs, ... }: {
    home.stateVersion = "22.11";
    home.packages = with pkgs;
    [ 
      hello gdu
    ];
    programs.zsh.enable = true;
  };
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
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
   tcpdump tig toilet tree tldr
   wget
   xclip
   zathura
   wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # shell environment
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
      # pkgs.tmuxPlugins.nord
      pkgs.tmuxPlugins.gruvbox
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
    ];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

