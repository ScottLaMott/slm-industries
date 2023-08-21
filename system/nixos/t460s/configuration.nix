#---------------------------------------------------
#---
#--- slmi-configuration.nix / System Configuration für slmi-vm
#---

{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./modules/slmi-environment.nix
    <home-manager/nixos>
  ];

  #--- bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  system = {
    #--- This value determines the NixOS release from which the default settings for stateful data were taken
    stateVersion = "22.11";
    copySystemConfiguration = true;
  };

  #--- networking
  networking = {
    networkmanager.enable = true;
    hostName = "slmi-vm";
    #nameservers = [ "127.0.0.53" ];
  };

  #--- virtualisation
  virtualisation.lxd.enable = true;

  #--- bluetooth
  hardware.bluetooth.enable = true;

  #--- Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
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

  #--- man pages
  # documentation.dev.enable = true;

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

  #--- shell environment
  programs.vim.defaultEditor = true;

  #--- user accounts
  users.users.slm = {
    isNormalUser = true;
    description = "Scott LaMott";
    extraGroups = [ "networkmanager" "wheel" "lxd" ];
    shell = pkgs.zsh;
  };

  #--- user home-manager configuration
  home-manager.users.slm = { pkgs, ... }: {
    home.stateVersion = "22.11";
    home.packages = with pkgs;
    [
      cmatrix gdu powerline-fonts
    ];

    programs.rofi.enable=true;      # FIXME
    programs.alacritty.enable=true;
    #programs.alacritty.settings= { }; # FIXME

    imports = [
      # ./modules/slmi-alacritty.nix
      ./modules/slmi-git.nix
      ./modules/slmi-fzf.nix
      ./modules/slmi-tmux.nix
      ./modules/slmi-vim.nix
      ./modules/slmi-xdg.nix
      ./modules/slmi-zsh.nix
    ];

  }; #--- user home-manager configuration end

}

