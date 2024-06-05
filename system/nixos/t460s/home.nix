  #--- user home-manager configuration


{ config, lib, pkgs, modulesPath, ... }: {
  home-manager.users.slm = {pkgs, ...}: {
    programs.zsh.enable = true;
    home.stateVersion = "23.11";
    home.packages = with pkgs; [
      atop
      beets
      cava
      cmatrix
      figlet
      glow
      gdu
      hwinfo
      mixxx
      nitch
      nix-tree
      picard
      picom
      powerline-fonts
      sl
      spotifyd playerctl
      # spotify-tui
      soco-cli
      strawberry
      # terminal-parrot
    ];

    imports = [
      ./modules/alacritty.nix
      ./modules/git.nix
      ./modules/fzf.nix
      ./modules/rofi.nix
      ./modules/picom.nix
      ./modules/tmux.nix
      ./modules/vim.nix
      ./modules/xdg.nix
      # ./modules/xsession.nix
      ./modules/zsh.nix
    ];
  }; #--- user home-manager configuration end

}
