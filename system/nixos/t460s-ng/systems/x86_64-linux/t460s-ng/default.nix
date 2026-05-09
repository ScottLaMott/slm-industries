#---
#--- systems/x86_64-linux/t460s-ng/default.nix
#---
{
  config,
  pkgs,
  ...
}: {
  # cachix.nix entweder hier importieren oder nach modules/nixos/ verschieben
  imports = [
    ./hardware.nix
  ];

  #--- bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
  };

  system.stateVersion = "23.05";

  #--- nix package manager options
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = ["root" "slm"];
  nix.extraOptions = "download-buffer-size = 100000000";

  #--- virtualisation
  virtualisation.incus.enable = true;
  virtualisation.incus.bucketSupport = false;
  networking.nftables.enable = true;
  virtualisation.libvirtd.enable = false;

  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;

  #--- sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
    settings.X11Forwarding = true;
  };

  services.xserver = {
    enable = true;
    resolutions = [{ x = 1920; y = 1080; }];
    xkb.layout = "de";
    xkb.options = "caps:escape";
    windowManager.awesome.enable = true;
    displayManager.lightdm.enable = true;
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  programs.ssh.forwardX11 = true;
  programs.ssh.enableAskPassword = true;
  programs.wireshark.enable = true;
  programs.nvf.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [];

  #--- user accounts
  users.users.slm = {
    isNormalUser = true;
    description = "Scott LaMott";
    extraGroups = ["networkmanager" "wheel" "wireshark" "lxd" "jackaudio" "libvirt" "incus-admin" "minecraft" "kvm"];
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

  xdg.mime.defaultApplications = {
    "inode/directory" = "pcmanfm.desktop";
  };
}
