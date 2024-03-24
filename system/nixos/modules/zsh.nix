#----------------------------------------------------------
#---
#--- zsh configuration / home-manager
#---
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    enableCompletion = false; # FIXME, true macht zsh-startup langsam
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh"; # FIXME

    zplug = {
      enable = true;
      plugins = [
        # { name = "hlissner/zsh-autopair"; }
        # {
          # name = "hlissner/zsh-autopair";
          # tags = "defer:2";
          # tags = [ "defer:2" ];
        # }
        {name = "endaaman/lxd-completion-zsh";}
        {name = "agkozak/zsh-z";}
      ];
    };

    envExtra = ''
      #----------------------------------------------------------
      # envExtra declared for .zshenv in slm-zsh.nix
      #

      # expand PATH
      PATH=~/.local/bin:$PATH
      EDITOR=nvim
    '';

    #initExtraFirst = ''
    #  #
    #  # profile zsh-startup
    #  zmodload zsh/zprof
    #'';

    initExtra = ''
      #----------------------------------------------------------
      # initExtra declared by .zshrc in slm-zsh.nix
      #

      # own new slm-zshrc
      [ -f  $XDG_CONFIG_HOME/zsh/slm-zshrc ]                && source $XDG_CONFIG_HOME/zsh/slm-zshrc
      [ -f  $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages ]  && source $XDG_DATA_HOME/zsh/bin/slm-colored-man-pages

      export LESS='-j8 -R'

      # wallpaper mit feh

      #----------------------------------------------------------
      #zprof
    '';

    history = {
      save = 100000;
      size = 100000;
      path = "$XDG_DATA_HOME/zsh/history";
    };

    shellAliases = {
      ".." = "cd ..";
      c = "clear";
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";

      #---        edit
      v = "vim";
      vs = "vim -S .session.vim";
      ns = "nvim -S .session.vim";
      n = "nvim";

      #---        network
      pgo = "ping -c1 -W5 www.google.com";
      p = "ping -c 3 -w5";
      ncs = "nmcli connection show";
      nds = "nmcli device show";

      #---        git
      gs = "git status";
      grs = "git remote show origin";

      #---        ls / df
      ls = "exa";
      la = "ls -la";
      ll = "ls -l";
      lR = "ls -lR";
      dfe = "df -t ext4"; # fs-type ext4

      #---        lxc / lxd
      cls = "lxc ls -cns4S -fcompact";
      clsr = "lxc ls -cns4S -fcompact status=running";
      clss = "lxc ls -cns4S -fcompact status=stopped";

      #---        history
      hg = "history | grep ";

      #---        tmux
      ta = "tmux attach";
      tl = "tmux switch-client -l";

      #---        libvirt
      virsh = "virsh --connect=qemu:///system";
      virt-viewer = "virt-viewer --connect=qemu:///system --attach";
      virt-manager = "virt-manager --connect=qemu:///system";

      #---        eyecandy hi hi
      nf = "clear; neofetch";
      cni = "clear; neofetch; inxi --full";
      cm = "cmatrix -u9 -s";
      cmr = "cmatrix -u9 -s -r";
      cct = "/usr/bin/theme.sh -i2";
    };
  };
}
