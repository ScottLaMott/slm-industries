{pkgs, ...}: {
  networking.hostName = "usb-gui";

  services.xserver = {
    enable = true;
    xkb.layout = "de";
    xkb.options = "caps:escape";

    displayManager.lightdm.enable = true;
    windowManager.awesome.enable = true;
  };

  networking.networkmanager.enable = true;
  users.users.slm.extraGroups = ["networkmanager"];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    firefox
    feh
    networkmanagerapplet
  ];
}
