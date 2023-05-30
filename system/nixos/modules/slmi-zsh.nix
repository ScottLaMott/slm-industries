#----------------------------------------------------------
#---
#--- zsh configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    dotDir = ".config/zsh"; # FIXME

    zplug = {
      enable = true;
      #zplugHome = ./zsh/zplug;
      #zplugHome = ./zplug-xxx;
      plugins = [
        { name = "hlissner/zsh-autopair"; tags = [ defer:2 ]; }
      ];
    };

    initExtra = ''
      #----------------------------------------------------------
      # declared by configuration.nix / slm
      #

      # own new slm-zshrc
      [ -f  $XDG_CONFIG_HOME/zsh/slm-zshrc ]                && source $XDG_CONFIG_HOME/zsh/slm-zshrc
      [ -f  $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages ]  && source $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages

      export LESS='-j5 -R'

      # wallpaper mit feh

      #----------------------------------------------------------
    '';

    history = {
      save = 100000;
      size = 100000;
      path = "$XDG_DATA_HOME/zsh/history";
    };

    shellAliases = {
      ".."  =    "cd ..";
      c     =    "clear";
      cp    =    "cp -i";
      mv    =    "mv -i";
      rm    =    "rm -i";
      #---        edit
      v     =    "vim";
      vs    =    "vim -S .session.vim";
      n     =    "nvim";
      #---        network
      pgo   =    "ping -c1 -W5 www.google.com";
      p     =    "ping -c 3 -w5";
      #---        git
      gs    =     "git status";
      #---        ls / df
      ls    =    "lsd";
      la    =    "ls -la";
      ll    =    "ls -l";
      lR    =    "ls -lR";
      dfe   =    "df -t ext4";    # fs-type ext4
      #---        history
      hg    =     "history | grep ";
      #---        eyecandy hi hi
      nf    =    "clear; neofetch";
      cm    =    "cmatrix -u9";
      cmr   =    "cmatrix -u9 -r";
      cct   =    "/usr/bin/theme.sh -i2";
    };
  };

}
