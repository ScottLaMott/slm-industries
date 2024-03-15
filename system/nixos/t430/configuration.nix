#---------------------------------------------------
#---
#--- slmi-configuration.nix / System Configuration für nixos-t430
#---
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/environment.nix
    <home-manager/nixos>
  ];

  #--- bootloader
  boot.loader = {
    grub.enable = true;
    grub.device = "/dev/sda";
    # grub.useOSProber = true;
  };

  system = {
    stateVersion = "23.11";
    copySystemConfiguration = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  #--- workaround nach upgrade auf 23.05
  nixpkgs.config = {
    permittedInsecurePackages = [
      "python-2.7.18.7"
    ];
  };

  #--- networking
  networking = {
   networkmanager.enable = true;
   hostName = "nixos-t430";
   # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
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
  fonts.packages = with pkgs; [
    font-awesome
  ];

  #--- enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    #--- require public key authentication for better security
    settings.PasswordAuthentication = true;
    settings.X11Forwarding = true;
    settings.KbdInteractiveAuthentication = true;
  };

  #--- enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "de";
    resolutions = [
      {
        x = 1600;
        y = 900;
      }
    ];
    windowManager.awesome.enable = true; #--- enable window manager
    displayManager.lightdm.enable = true; #--- enable login manager
    xkbOptions = "caps:escape"; #--- map caps to escape
  };

  # Configure console keymap
  console.keyMap = "de";

  #--- shell environment
  programs.vim.defaultEditor = true;
  programs.zsh.enable = true;
  programs.ssh.forwardX11 = true;

  #--- user accounts
  users.users.slm = {
    isNormalUser = true;
    description = "Scott LaMott";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  #--- user home-manager configuration
  home-manager.users.slm = {pkgs, ...}: {
    programs.zsh.enable = true;
    home.stateVersion = "23.11";
    home.packages = with pkgs; [
      atop
      cmatrix
      figlet
      gdu
      mixxx
      picom
      powerline-fonts
      sl
      soco-cli
      tmux
      # terminal-parrot
    ];

    imports = [
      ./modules/alacritty.nix
      ./modules/git.nix
      ./modules/fzf.nix
      ./modules/rofi.nix
      ./modules/picom.nix
      ./modules/tmux.nix
      ./modules/vim.nix
      ./modules/xdg.nix
      ./modules/xsession.nix
      ./modules/zsh.nix
    ];
  }; #--- user home-manager configuration end

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    acpi
    alacritty
    bat
    brave
    brightnessctl
    btop
    cmatrix
    fd
    fzf
    git
    inxi
    neofetch
    ranger
    sl
    speedtest-cli
    soco-cli
    tig
    tmux
    vim
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
