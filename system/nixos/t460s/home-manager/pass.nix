#----------------------------------------------------------
#---
#--- pass (password-store) + GPG / home-manager
#---

{ config, lib, pkgs, ... }: {

  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
  };

  programs.password-store = {
    enable = true;
    settings.PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
  };

}
