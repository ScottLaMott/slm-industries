#--- xdg configuration
{ config, lib, pkgs, modulesPath, ... }: {

  programs.xdg = {
    enable = true;
  };

}
