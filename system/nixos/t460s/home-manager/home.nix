  #--- user home-manager configuration

{ config, lib, pkgs, modulesPath, ... }: {
  home-manager.users.slm = {pkgs, ...}: {
    programs.zsh.enable = true;
    home.stateVersion = "23.11";
    home.packages = with pkgs; [
      atop
      figlet
      glow
      gdu
      hwinfo
      nitch
      nix-tree
      picom
      playerctl
      powerline-fonts
      # tmuxp
      yazi

      # fun, teilweise in devbox fun-box
      # cmatrix
      # sl
      # terminal-parrot

      # music
      beets
      cava
      mixxx
      picard
      soco-cli
      spotify-player
      strawberry
      theme-sh
      #
      lnav
      devbox
    ];

    imports = [
      ./alacritty.nix
      ./cava.nix
      ./git.nix
      ./fzf.nix
      ./rofi.nix
      ./picom.nix
      ./readline.nix
      ./starship.nix
      ./tmux.nix
      ./vim.nix
      ./xdg.nix
      # ./xsession.nix
      ./yazi.nix
      ./zsh.nix
    ];
  }; #--- user home-manager configuration end

}
