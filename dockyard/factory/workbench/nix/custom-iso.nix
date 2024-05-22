# custom-iso.nix

{ nixpkgs ? <nixpkgs>, system ? "x86_64-linux" }:

let
  myisoconfig = { pkgs, ... }: {
    imports = [
      # "${nixpkgs}/nixos/modules/installer/cd-dvd/iso-image.nix"
      # oder lokaler clone von nixpkgs
      # "/home/slm/ws/nixpkgs/nixos/modules/installer/cd-dvd/iso-image.nix"
      "/home/slm/ws/nixpkgs/nixos/modules/installer/cd-dvd/iso-image.nix"
      # oder lokale kopie von nixpkgs/...
      # "slm-iso-image.nix"
    ];

    # building faster
    isoImage.squashfsCompression = "gzip -Xcompression-level 1";

    isoImage.forceTextMode.defaut = true;
    # config.boot.loader.timeout = 20;
    # syslinuxTimeout = 20;

    system.stateVersion = "23.11";
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      keyMap = "de";
      font = "Lat2-Terminus16";
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];

    networking.hostName = "mynixos";
    services.nginx.enable = true;

    environment.systemPackages = with pkgs; [
      nmap
      tmux
      vim
    ];

    users.extraUsers.root.password = "rx";

    users.users.slm = {
      isNormalUser = true;
      description = "Scott LaMott";
      extraGroups = ["networkmanager" "wheel" "dialout"];
      password = "slmx";
    };

    #--- enable the OpenSSH daemon.
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
      # settings.PasswordAuthentication = false;
      settings.X11Forwarding = true;
    };

  };

  evalNixos = configuration: import "${nixpkgs}/nixos" {
    inherit system configuration;
  };

in { iso = (evalNixos myisoconfig).config.system.build.isoImage; }
