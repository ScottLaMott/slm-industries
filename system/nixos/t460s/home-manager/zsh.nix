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
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    zplug = {
      enable = true;
      plugins = [
        { name = "hlissner/zsh-autopair"; tags = [ "defer:2" ]; }
        # { name = "endaaman/lxd-completion-zsh"; } # ???
        # { name = "agkozak/zsh-z"; }
      ];
    };

    sessionVariables = {
      EDITOR = "nvim";
      LESS = "-j10 -R";
    };

    envExtra = ''
      #----------------------------------------------------------
      # envExtra declared for .zshenv in slm-zsh.nix
      #

      # expand PATH
      PATH=~/.local/bin:$PATH
    '';

    initContent = ''
      #----------------------------------------------------------
      # initContent declared by .zshrc in zsh.nix
      #

      # own new slm-zshrc
      [ -f  $XDG_CONFIG_HOME/zsh/slm-zshrc ]                && source $XDG_CONFIG_HOME/zsh/slm-zshrc
      [ -f  $XDG_CONFIG_HOME/zsh/slm-colored-man-pages ]    && source $XDG_CONFIG_HOME/zsh/slm-colored-man-pages

      #--- edit command line in $EDITOR (v in normal mode)
      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey -M vicmd 'v' edit-command-line

      # Jump to begin of line / insert mode command line history
      zle-history-line-set () {
        zle vi-beginning-of-line;
        zle vi-cmd-mode;
      }
      zle -N zle-history-line-set

      #--- completion
      zmodload zsh/complist
      #
      # use vim keys in tab complete menu:
      zstyle ':completion:*' menu select
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
      bindkey -v '^?' backward-delete-char

      # eval "$(zoxide init zsh)"

      # wallpaper mit feh

      # manix shortcuts (Query muss vor --source stehen)
      mnix()   { manix "$@" --source nixos_options,hm_options; }
      mnixos() { manix "$@" --source nixos_options; }

      # nix-index command-not-found handler für zsh
      command_not_found_handler() {
        local cmd=$1
        local attrs
        attrs=$(${pkgs.nix-index}/bin/nix-locate --minimal --no-group --type x --type s --whole-name --at-root "/bin/$cmd" 2>/dev/null)
        if [ -z "$attrs" ]; then
          echo "zsh: command not found: $cmd" >&2
        else
          echo "nix shell nixpkgs#$(echo "$attrs" | head -1 | sed 's/\..*//')" >&2
        fi
        return 127
      }

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
      tls   = "tmux list-sessions";
      ta    = "tmux attach";
      tl    = "tmux switch-client -l";

      #--- nix
      nie   = "nix-instantiate --eval";
      db    = "devbox";

      #--- music
      pm    = "pulsemixer";

      #--- prismlauncher, neuste version, selbst gebaut
      prismlauncher  = "/home/slm/ws/projects/prismlauncher/result/bin/prismlauncher";

      #--- eyecandy hi hi
      nf    = "clear; neofetch";
      cni   = "clear; neofetch; inxi --full";
      cm    = "cmatrix -u9 -s";
      cmr   = "cmatrix -u9 -s -r";
      cct   = "theme.sh -i2";
    };
  };
}
