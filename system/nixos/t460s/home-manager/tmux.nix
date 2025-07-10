#----------------------------------------------------------
#---
#--- tmux configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.tmux = {
    enable        = true;
    tmuxp.enable  = true;
    baseIndex     = 1;
    escapeTime    = 1;
    keyMode       = "vi";
    prefix        = "M-a";
    # shortcut      = "a";
    newSession    = true;
    historyLimit  = 100000;
    terminal      = "screen-256color";
    mouse         = true;

    plugins = with pkgs; [
      tmuxPlugins.gruvbox
      # tmuxPlugins.nord
      tmuxPlugins.tmux-fzf
      # pkgs.tmuxPlugins.resurrect
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-dir '~/.tmux/resurrect'
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-processes 'journalctl watch man ssh vim nvim'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          # set -g status-right 'Continuum status: #{continuum_status}' ### FIXME:
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.weather;
        # plugin = tmuxPlugins.tmux-floax;
        extraConfig = ''
          # set -g @resurrect-capture-pane-contents 'on' #!!! FIXME
        '';
      }
    ];

    extraConfig = ''
      set-option -g status-left-length 20
      set-option -g renumber-windows on
      set-option -g pane-border-lines heavy
      set-option -g pane-border-indicators colour

      set-option -ag status-right '#{?pane_synchronized, #[bg=yellow]SYNC#[default],}'

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

      TMUX_FZF_LAUNCH_KEY="C-f"                # tmux-fzf plugin c-a c-f
    '';
  };

}
