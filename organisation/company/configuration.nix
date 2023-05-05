#---------------------------------------------------
# slm@schoco-company.com
#
# configuration.nix / System Configuration in /etc/nixos/configuration.nix
#
#---------------------------------------------------

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{ imports =
  [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos-v-0-9"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.utf8"; LC_IDENTIFICATION = "de_DE.utf8"; LC_MEASUREMENT = "de_DE.utf8";
    LC_MONETARY = "de_DE.utf8"; LC_NAME = "de_DE.utf8"; LC_NUMERIC = "de_DE.utf8";
    LC_PAPER = "de_DE.utf8"; LC_TELEPHONE = "de_DE.utf8"; LC_TIME = "de_DE.utf8";
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
  services.xserver.windowManager.dwm.enable = true;
  # Enable login manager
  services.xserver.displayManager.lightdm.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "de"; xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true; hardware.pulseaudio.enable = false;

  # SLM müllt journactl voll, entfernen FIXME
  #security.rtkit.enable = true; services.pipewire = {
  #  enable = true; alsa.enable = true; alsa.support32Bit = true;
  #  pulse.enable = true;
  #};

  # Enable touchpad support (enabled default in most desktopManager).
  #  services.xserver.libinput.enable = true;

  #  user account for slm / Scott LaMott
  users.users.slm = {
    isNormalUser = true;
    description = "Scott LaMott";
    extraGroups = [ "networkmanager" "wheel" "dialout" "libvirtd" "qemu-libvirtd" ];
    shell = pkgs.zsh;
  };

  users.users.guest = {
    isNormalUser = true;
    description = "G. Uest";
    extraGroups = [ ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run: $ nix
  # search wget
  environment.systemPackages = with pkgs; [
   alacritty
   bat brave btop
   curl
   dmenu
   fd file firefox fzf
   git
   htop
   ipcalc
   killall
   libvirt libguestfs lsd lua
   nmap neofetch neovim nodejs
   pulsemixer pure-prompt python
   qemu qemu_kvm
   ranger ripgrep rofi
   screen silver-searcher speedtest-cli
   ssh-askpass-fullscreen
   stow sxiv tshark
   tcpdump tig toilet tree tldr
   virt-manager virt-viewer
   wget
   xclip
   yarn
   zathura
  ];

  # add zsh to /etc/shells
  environment.shells = with pkgs; [ zsh ];
  # needed for system package completion
  environment.pathsToLink = [ "/share/zsh" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions. programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true; enableSSHSupport = true;
  # };

  programs.ssh = {
    enableAskPassword = true;
  };

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

  # libvirt-daemon
  virtualisation.libvirtd.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon. services.openssh.enable = true;
  services.openssh.enable = true;

  # Open ports in the firewall. networking.firewall.allowedTCPPorts = [
  # ... ]; networking.firewall.allowedUDPPorts = [ ... ]; Or disable the
  # firewall altogether. networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database
  # versions on your system were taken.
  system.stateVersion = "22.05"; # Did you read the comment?

  # fonts.fontconfig.enable = true;
  # fonts.fontconfig.localConf = "FiraCode";
  fonts.fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "Hack" "FiraCode" "DroidSansMono" ]; })
    ];
}
