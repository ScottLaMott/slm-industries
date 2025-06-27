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
    # enableCompletion = false; # FIXME, true macht zsh-startup langsam
    enableCompletion = true; # FIXME, VIELLEICHT gefixt in 25.05, testen
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh"; # FIXME

    zplug = {
      enable = true;
      plugins = [
        # { name = "hlissner/zsh-autopair"; tags = [ "defer:2" ]; }
        { name = "endaaman/lxd-completion-zsh"; }
        { name = "agkozak/zsh-z"; }
      ];
    };

    sessionVariables = {
      EDITOR = "vim";
      LESS = "-j10 -R";
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

    initContent = ''
      #----------------------------------------------------------
      # initContent declared by .zshrc in zsh.nix
      #

      # own new slm-zshrc
      [ -f  $XDG_CONFIG_HOME/zsh/slm-zshrc ]                && source $XDG_CONFIG_HOME/zsh/slm-zshrc
      [ -f  $XDG_CONFIG_HOME/zsh/slm-colored-man-pages ]    && source $XDG_CONFIG_HOME/zsh/slm-colored-man-pages

      # export LESS='-j8 -R'

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
      ".."  = "cd ..";
      c     = "clear";
      cp    = "cp -i";
      mv    = "mv -i";
      rm    = "rm -i";

      #--- edit
      nvim  = "/home/slm/ws/projects/neovim/nvf/result/bin/nvim";
      v     = "vim";
      vs    = "vim -S .session.vim";
      ns    = "nvim -S .session.vim";
      n     = "nvim";

      #--- network
      pgo   = "ping -c1 -W5 www.google.com";
      p     = "ping -c 3 -w5";
      ncs   = "nmcli connection show";
      nds   = "nmcli device show";

      #--- git
      gs    = "git status";
      grs   = "git remote show origin";

      #--- ls / df
      ls    = "exa";
      la    = "ls -la";
      ll    = "ls -l";
      lR    = "ls -lR";
      dfe   = "df -t ext4"; # fs-type ext4

      #--- incus
      ils   = "incus ls -cns4S -fcompact";
      ilsr  = "incus ls -cns4S -fcompact status=running";
      ilss  = "incus ls -cns4S -fcompact status=stopped";
      ie    = "incus exec";

      #--- history
      hg    = "history | grep ";

      #--- tmux
      ta    = "tmux attach";
      tl    = "tmux switch-client -l";

      #--- libvirt
      virsh        = "virsh --connect=qemu:///system";
      virt-viewer  = "virt-viewer --connect=qemu:///system --attach";
      virt-manager = "virt-manager --connect=qemu:///system";

      #--- nix
      nie   = "nix-instantiate --eval";
      db    = "devbox";

      #--- music
      pm    = "pulsemixer";

      #--- eyecandy hi hi
      nf    = "clear; neofetch";
      cni   = "clear; neofetch; inxi --full";
      cm    = "cmatrix -u9 -s";
      cmr   = "cmatrix -u9 -s -r";
      cct   = "theme.sh -i2";
    };
  };
}
