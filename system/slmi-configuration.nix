#---------------------------------------------------
# slm@slm-industries.xyz
#
# configuration.nix / System Configuration für slmi-vm
#
#---------------------------------------------------

{ config, pkgs, ... }: {

imports =
  [ #--- Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./modules/slmi-tmux.nix
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

  #--- filesysem
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };
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

  #--- add zsh to /etc/shells
  environment.shells = with pkgs; [ zsh ];

  #--- list installed packages system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    alacritty
    bat brave btop
    curl
    dmenu
    fd file fzf
    git
    htop
    ipcalc
    killall
    lsd lua
    nmap neofetch neovim nodejs
    pulsemixer pure-prompt python
    ranger ripgrep rofi
    screen silver-searcher speedtest-cli
    stow sxiv tshark
    tcpdump tig tio toilet tree tldr
    wget
    xclip
    zathura
    wget
    speedtest-cli
  ];

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

