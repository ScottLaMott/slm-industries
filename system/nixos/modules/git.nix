#----------------------------------------------------------
#---
#--- git configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.git = {
    enable = true;
    userName = "Scott LaMott";
    userEmail = "slm@slm-industries";
    extraConfig = {
      core = { editor = "/home/slm/ws/projects/neovim/nvf/result/bin/nvim"; };
    };
    aliases = {
      s = "status";
    };
  };

}
