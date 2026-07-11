{
  pkgs,
  lib,
  ...
}: {
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "de_DE.UTF-8";

  networking.hostName = lib.mkDefault "usb";

  users.users.slm = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "nixos";
    shell = pkgs.zsh;
  };

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    tmux
    vim
    git
    nmap
    wget
    curl
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  swapDevices = [];

  system.stateVersion = "26.05";
}
