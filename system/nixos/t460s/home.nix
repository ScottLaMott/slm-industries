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
      #
      lnav
      devbox
    ];

    imports = [
      ./modules/alacritty.nix
      ./modules/cava.nix
      ./modules/git.nix
      ./modules/fzf.nix
      ./modules/rofi.nix
      ./modules/picom.nix
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
