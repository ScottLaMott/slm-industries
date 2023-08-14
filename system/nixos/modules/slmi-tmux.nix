#----------------------------------------------------------
#---
#--- tmux configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 1;
    keyMode = "vi";
    shortcut = "a";
    newSession = true;
    historyLimit = 100000;
    extraConfig = ''
      set-option -g status-left-length 20
      set-option -g default-terminal "screen-256color"
      set-option -g mouse on
      set-option -g renumber-windows on
      TMUX_FZF_LAUNCH_KEY="C-f"        # tmux-fzf plugin c-a c-f
      bind-key -n M-h select-pane -L
      bind-key -n M-j select-pane -D
      bind-key -n M-k select-pane -U
      bind-key -n M-l select-pane -R
      bind-key -n M-z resize-pane -Z
      bind-key -n M-s split-window
      bind-key -n M-v split-window -h
      bind-key -n M-b switch-client -l
      bind-key -n M-p switch-client -p
      bind-key -n M-n switch-client -n
    '';
    plugins = [
      pkgs.tmuxPlugins.gruvbox
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
      pkgs.tmuxPlugins.tmux-fzf
    ];
  };

}
