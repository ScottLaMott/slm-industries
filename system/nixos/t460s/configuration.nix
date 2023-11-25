#---------------------------------------------------
#---
#--- slmi-configuration.nix / System Configuration für slmi-industries
#---

{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./modules/environment.nix
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

  #--- workaround nach upgrade auf 23.05
  nixpkgs.config = {
    permittedInsecurePackages = [
      "python-2.7.18.6"
    ];
  };

  #--- nfs mount
  fileSystems."/mnt/homes" =
  { device = "alpha:/volume1/homes";
    fsType = "nfs";
  };

  #--- networking
  networking = {
    networkmanager.enable = true;
    hostName   = "slm-industries";
    extraHosts =
      ''
        # ubuntu-container
        10.151.127.10   ubuntu-23-04
        10.151.127.101  u-1
        10.151.127.102  u-2
        10.151.127.110  u-test
        10.151.127.111  u-ansible
        10.151.127.112  u-tmux
        10.151.127.113  u-zplug
        # enterprise-container
        10.151.127.200  enterprise-v-0-1
        10.151.127.201  et-1
        10.151.127.202  et-2
        # alpine containers
        10.151.127.120  alpine
        10.151.127.130  alpine-test
        10.151.127.131  a-1
        10.151.127.132  a-2
      '';

    #nameservers = [ "127.0.0.53" ];
  };

  #--- virtualisation
  virtualisation.lxd.enable = true;

  #--- bluetooth
  hardware.bluetooth.enable = true;

  #--- enable sound with pipewire.
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
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.X11Forwarding = true;
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

  #--- shell environment
  programs.vim.defaultEditor = true;
  programs.zsh.enable = true;
  programs.ssh.forwardX11 = true;
  #programs.hyprland.enable = true;

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
      atop
      cmatrix
      gdu
      mixxx
      picom
      powerline-fonts
      sl
      terminal-parrot
    ];

    # services.picom.enable = true;         # für Terminal Transparenz

    imports = [
      ./modules/alacritty.nix
      ./modules/git.nix
      ./modules/fzf.nix
      ./modules/rofi.nix
      ./modules/tmux.nix
      ./modules/vim.nix
      ./modules/xdg.nix
      ./modules/xsession.nix
      ./modules/zsh.nix
    ];
  }; #--- user home-manager configuration end

}

