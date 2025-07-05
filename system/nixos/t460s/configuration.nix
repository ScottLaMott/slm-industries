#---
#--- slmi-configuration.nix / System Configuration für slm-industries
#---
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./cachix.nix
    ./modules/environment.nix
    ./modules/fonts.nix
    ./modules/networking.nix
    ./modules/tlp.nix
    <home-manager/nixos>
    ./home-manager/home.nix
  ];

  #--- bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
  };

  system = {
    stateVersion = "23.05";
    copySystemConfiguration = true;
  };

  #--- nix package manager options
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # nix.settings.sandbox =false;
  nix.extraOptions = "download-buffer-size = 100000000";

  #--- nfs mount
  # fileSystems."/mnt/homes" = {
  #   device = "alpha:/volume1/homes";
  #   fsType = "nfs";
  # };
  #   options = [
  #     "x-systemd.automount"
  #     "x-systemd.idle-timeout=600"
  #     "noauto"
  #   ];
  # };

  #--- virtualisation
  #- incus, lxd nachfolger
  virtualisation.incus.enable = true;
  #- virtmanager
  virtualisation.libvirtd.enable = false;
  #--- test ---# virtualisation.virtualbox.host.enable = true;

  hardware.graphics.enable = true;

  #--- bluetooth
  hardware.bluetooth.enable = true;

  #--- enable sound with pipewire.
  # sound.enable = true;
  services.pulseaudio.enable = false;
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
    useXkbConfig = true; # use xkbOptions in tty.
  };

  #--- enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
    settings.X11Forwarding = true;
  };

  #--- enable the X11 windowing system.
  services.xserver = {
    enable = true;
    resolutions = [
      {
        x = 1920;
        y = 1080;
      }
    ];
    xkb.layout = "de";
    xkb.options = "caps:escape"; #--- map caps to escape
    windowManager.awesome.enable = true; #--- enable window manager
    displayManager.lightdm.enable = true; #--- enable login manager
  };

  services.spotifyd = {
    enable = false;
    settings =
      {
        global = {
          username = "Alex";
          password = "foo";
        };
      };
  };

  # für git-push, git anmeldung
  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  #--- shell environment
  # programs.vim.defaultEditor = true;
  programs.zsh.enable = true;
  programs.zsh.enableGlobalCompInit = false;
  programs.ssh.forwardX11 = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  #--- user accounts
  users.users.slm = {
    isNormalUser = true;
    description = "Scott LaMott";
    extraGroups = ["networkmanager" "wheel" "lxd" "jackaudio" "libvirtd" "incus-admin" ];
    ignoreShellProgramCheck = true;
    shell = pkgs.zsh;
  };

}
