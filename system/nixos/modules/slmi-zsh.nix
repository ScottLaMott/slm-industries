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
    dotDir = ".config/zsh";
    shellAliases = {
      ".."  =    "cd ..";
      c     =    "clear";
      cp    =    "cp -i";
      mv    =    "mv -i";
      rm    =    "rm -i";
      #---        edit
      v     =    "vim";
      vs    =    "vim -S s.vim";
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
    history = {
      save = 100000;
      size = 100000;
      path = "$XDG_DATA_HOME/zsh/history";
    };
    zplug = {
      enable = true;
      #zplugHome = ./zsh/zplug;
      #zplugHome = ./zplug-xxx;

      # FIXME FIXME FIXME ---------------------------------------
      # alle ungültig weil SHELL-Environment
      #zplugHome = ${XDG_CONFIG_HOME}/zsh/zplug;
      #zplugHome = $XDG_CONFIG_HOME/zsh/zplug;
      #zplugHome = "${XDG_CONFIG_HOME}/zsh/zplug";
      #zplugHome = "$XDG_DATA_HOME/zsh/zplug";
      #zplugHome = $XDG_DATA_HOME/zsh;
      #zplugHome = $XDG_CONFIG_HOME/zsh;
      #zplugHome = "$XDG_CONFIG_HOME/zsh/zplug";

      #zplugHome = "${config.xdg.dataHome}/zsh/zplug";
      #zplugHome = "${config.xdg.configHome}/zsh/zplug";
      #zplugHome = $config.xdg.dataHome/zsh/zplug;
      #zplugHome = ${config.xdg.dataHome}/zsh/zplug;
      # FIXME FIXME FIXME ---------------------------------------

      plugins = [
        { name = "hlissner/zsh-autopair"; tags = [ defer:2 ]; }
        #{ name = "zsh-users/zsh-autosuggestions"; tags = [ defer:2 ]; ?? on:"zsh-users/zsh-completions" ?? }
      ];
    };
    initExtra = ''
      #----------------------------------------------------------
      # declared by slmi-configuration.nix / slm
      #

      # completion --------------------------
      zmodload zsh/complist
      #
      # Use vim keys in tab complete menu:
      zstyle ':completion:*' menu select
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
      bindkey -v '^?' backward-delete-char

      # color -------------------------------
      # autoload -U colors && colors

      # prompt ------------------------------
      fpath=(/home/slm/ws/github/purification $fpath)
      autoload -Uz prompt_purification_setup && prompt_purification_setup

      # slm ---------------------------------
      # Jump to begin of line / insert mode command line history
      zle-history-line-set () {
          zle vi-beginning-of-line;
          zle vi-cmd-mode;
      }
      zle -N zle-history-line-set

      feh --bg-fill $XDG_CONFIG_HOME/wallpaper/background-wallpaper # FIXME

      # colored man-pages
      [ -f  $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages ]  && source $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages

      # display less search in position j
      export LESS='-j5 -R'

      # wallpaper mit feh

      #----------------------------------------------------------
    '';
  };

}
