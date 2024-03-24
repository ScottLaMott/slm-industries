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
    prefix = "M-a";
    # shortcut = "a";
    newSession = true;
    historyLimit = 100000;
    plugins = [
      pkgs.tmuxPlugins.gruvbox
      pkgs.tmuxPlugins.tmux-fzf
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
    ];
    extraConfig = ''
      set-option -g status-left-length 20
      set-option -g default-terminal "screen-256color"
      set-option -g mouse on
      set-option -g renumber-windows on
      set-option -g pane-border-lines double
      set-option -g pane-border-indicators arrows
      TMUX_FZF_LAUNCH_KEY="C-f"                # tmux-fzf plugin c-a c-f
      bind-key -n M-h select-pane -L
      bind-key -n M-j select-pane -D
      bind-key -n M-k select-pane -U
      bind-key -n M-l select-pane -R
      bind-key -n M-z resize-pane -Z
      bind-key -n M-s split-window -v -c "#{pane_current_path}"
      bind-key -n M-v split-window -h -c "#{pane_current_path}"
      bind-key -n M-b switch-client -l
      bind-key -n M-p switch-client -p
      bind-key -n M-n switch-client -n
      bind-key -n M-d set-window-option synchronize-pane
      set -g @resurrect-dir '~/.tmux/resurrect'
      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-processes 'journalctl watch btop man ssh'
      set -g @continuum-restore 'on'
    '';
  };

}
