#----------------------------------------------------------
#---
#--- git configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    signing.format = null;
    settings = {
      user.name = "Scott LaMott";
      user.email = "slm@slm-industries";
      core = { editor = "/home/slm/ws/projects/neovim/nvf/result/bin/nvim"; };
      credential.helper = "libsecret";
      aliases = {
       s = "status";
     };
    };
  };

}
