{pkgs, ...}: {
  networking.hostName = "usb-gui";

  services.xserver = {
    enable = true;
    xkb.layout = "de";
    xkb.options = "caps:escape";

    displayManager.lightdm.enable = true;
    windowManager.awesome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    firefox
    feh
  ];
}
