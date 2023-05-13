#---------------------------------------------------
#
# slmi-configuration.nix / System Configuration für slmi-vm
#
#---------------------------------------------------

{ config, pkgs, ... }: {

imports =
  [
    ./hardware-configuration.nix
    ./modules/slmi-environment.nix
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

    #rofi.enable=true FIXME

    imports = [
      ./modules/slmi-git.nix
      ./modules/slmi-fzf.nix
      ./modules/slmi-tmux.nix
      ./modules/slmi-vim.nix
      ./modules/slmi-xdg.nix
      ./modules/slmi-zsh.nix
    ];

  }; #--- user home-manager configuration end

}

