  #--- user home-manager configuration

{ config, lib, pkgs, modulesPath, ... }: {
  home-manager.users.slm = {pkgs, ...}: {
    programs.zsh.enable = true;
    home.stateVersion = "24.11";
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
      # music
      beets
      cava
      mixxx
      picard
      soco-cli
      spotify-player
      strawberry
      #
      lnav
      devbox
      theme-sh
      # neovim
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
