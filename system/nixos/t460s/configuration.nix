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
    ./modules/gns3.nix
  ];

  #--- bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
  };

  system = {
    stateVersion = "23.05";
    # copySystemConfiguration = true;
  };

  #--- nix package manager options
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # nix.settings.trusted_users = 
  nix.settings.trusted-users = [ "root" "slm" ];
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

  # services.spotifyd = {
  #   enable = false;
  #   settings =
  #     {
  #       global = {
  #         username = "Alex";
  #         password = "foo";
  #       };
  #     };
  # };

  # für git-push, git anmeldung
  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  #--- shell environment
  programs.ssh.forwardX11 = false;
  programs.ssh.enableAskPassword = true;

  programs.wireshark.enable = true;
  programs.nvf.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];
  
  # programs.nvf.enableManpages = true; 

  #--- user accounts
  users.users.slm = {
    isNormalUser = true;
    description = "Scott LaMott";
    extraGroups = ["networkmanager" "wheel" "wireshark" "lxd" "jackaudio" "libvirt" "incus-admin" "minecraft" "kvm" ];
    ignoreShellProgramCheck = true;
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  services.minecraft-server.enable = true;
  services.minecraft-server.eula = true;
  services.minecraft-server.declarative = true;
  services.minecraft-server.serverProperties = {
    allow-cheats = true;
    server-port = 25565;
  };

  # Second vanilla server instance on port 25566
  systemd.sockets.minecraft-server2 = {
    bindsTo = [ "minecraft-server2.service" ];
    socketConfig = {
      ListenFIFO = "/run/minecraft-server2.stdin";
      SocketMode = "0660";
      SocketUser = "minecraft";
      SocketGroup = "minecraft";
      RemoveOnStop = true;
      FlushPending = true;
    };
  };

  systemd.services.minecraft-server2 =
    let
      dataDir = "/var/lib/minecraft2";
      jvmOpts = "-Xmx4096M -Xms2048M";
      serverPropertiesFile = pkgs.writeText "server2.properties" ''
        # server.properties managed by NixOS configuration
        server-port=25566
        allow-cheats=true
      '';
      eulaFile = builtins.toFile "eula2.txt" ''
        # eula.txt managed by NixOS Configuration
        eula=true
      '';
      stopScript = pkgs.writeShellScript "minecraft-server2-stop" ''
        echo stop > /run/minecraft-server2.stdin
        while kill -0 "$1" 2> /dev/null; do
          sleep 1s
        done
      '';
    in
    {
      description = "Minecraft Server 2 Service";
      wantedBy = [ "multi-user.target" ];
      requires = [ "minecraft-server2.socket" ];
      after = [ "network.target" "minecraft-server2.socket" ];

      serviceConfig = {
        ExecStart = "${pkgs.minecraft-server}/bin/minecraft-server ${jvmOpts}";
        ExecStop = "${stopScript} $MAINPID";
        Restart = "always";
        User = "minecraft";
        WorkingDirectory = dataDir;
        StateDirectory = "minecraft2";

        StandardInput = "socket";
        StandardOutput = "journal";
        StandardError = "journal";

        CapabilityBoundingSet = [ "" ];
        DeviceAllow = [ "" ];
        LockPersonality = true;
        PrivateDevices = true;
        PrivateTmp = true;
        PrivateUsers = true;
        ProtectClock = true;
        ProtectControlGroups = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectProc = "invisible";
        RestrictAddressFamilies = [ "AF_INET" "AF_INET6" ];
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        SystemCallArchitectures = "native";
        UMask = "0077";
      };

      preStart = ''
        ln -sf ${eulaFile} eula.txt
        cp --remove-destination ${serverPropertiesFile} server.properties
        chmod +w server.properties
      '';
    };

  xdg.mime.defaultApplications = {
  "inode/directory" = "pcmanfm.desktop";
};

  # config.gns3-server = { };

  # services.gns3-server = { 
    # enable = true;
    # settings = {
      # host = "0.0.0.0"; 
    #   port = 3080; 
    # };
  # };
}
