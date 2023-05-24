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
    extraConfig = ''
      set-option -g status-left-length 20
      set-option -g default-terminal "screen-256color"
      set-option -g mouse on
      set-option -g renumber-windows on
      TMUX_FZF_LAUNCH_KEY="C-f"        # tmux-fzf plugin c-a c-f
    '';
    plugins = [
      pkgs.tmuxPlugins.gruvbox
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
      pkgs.tmuxPlugins.tmux-fzf
    ];
  };

}
