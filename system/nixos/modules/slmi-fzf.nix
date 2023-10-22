#----------------------------------------------------------
#---
#--- fzf configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --hidden";
    defaultOptions = [
      "--header-first"
      "--layout=reverse"
      "--height=80%"
      "--cycle"
      "--border=rounded"
      "--info=inline"
      "--prompt='fzf-> '"
      "--scroll-off=5"
      "--preview=bat"
      ];
    changeDirWidgetCommand = "fd --type d --hidden";
  };

}
