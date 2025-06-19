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
      ./modules/alacritty.nix
      ./modules/cava.nix
      ./modules/git.nix
      ./modules/fzf.nix
      ./modules/rofi.nix
      ./modules/picom.nix
      ./modules/readline.nix
      ./modules/starship.nix
      ./modules/tmux.nix
      ./modules/vim.nix
      ./modules/xdg.nix
      # ./modules/xsession.nix
      ./modules/yazi.nix
      ./modules/zsh.nix
    ];
  }; #--- user home-manager configuration end

}
