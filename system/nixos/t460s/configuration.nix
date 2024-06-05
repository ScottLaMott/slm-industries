#---------------------------------------------------
#---
#--- slmi-configuration.nix / System Configuration für slmi-industries
#---
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/environment.nix
    ./modules/networking.nix
    <home-manager/nixos>
    ./home.nix
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

  nix.settings.experimental-features = ["nix-command" "flakes"];

  #--- workaround nach upgrade auf 23.05
  nixpkgs.config = {
    permittedInsecurePackages = [
      "python-2.7.18.8"
    ];
    allowUnfree = true;
  };

  #--- nfs mount
  # fileSystems."/mnt/homes" = {
  #   device = "alpha:/volume1/homes";
  #   fsType = "nfs";
  # };

  #--- virtualisation
  virtualisation.lxd.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = true;
  hardware.opengl.enable = true;

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
    useXkbConfig = true; # use xkbOptions in tty.
  };

  #--- fonts
  fonts.packages = with pkgs; [
    font-awesome
  ];

  #--- enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    # settings.PasswordAuthentication = true;
    settings.PasswordAuthentication = false;
    settings.X11Forwarding = true;
  };

  #--- enable the X11 windowing system.
  services.xserver = {
    enable = true;
    resolutions = [
      {
        x = 1600;
        y = 900;
      }
    ];
    xkb.layout = "de";
    xkb.options = "caps:escape"; #--- map caps to escape
    windowManager.awesome.enable = true; #--- enable window manager
    displayManager.lightdm.enable = true; #--- enable login manager
  };

  services.spotifyd = {
    enable = true;
    settings =
      {
        global = {
          username = "Alex";
          password = "foo";
        };
      };
  };

  #--- shell environment
  programs.vim.defaultEditor = true;
  programs.zsh.enable = true;
  programs.ssh.forwardX11 = true;

  #--- user accounts
  users.users.slm = {
    isNormalUser = true;
    description = "Scott LaMott";
    extraGroups = ["networkmanager" "wheel" "lxd" "jackaudio" "libvirtd"];
    shell = pkgs.zsh;
  };

}
