  #--- user home-manager configuration

{ config, lib, pkgs, modulesPath, ... }: {
    # programs.zsh.enable = true;
    home.username = "slm";
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
      powerline-fonts
      rofi
      theme-sh
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
      playerctl
      soco-cli
      spotify-player
      starship
      strawberry
      #
      lnav
      devbox
    ];

    imports = [
      ./home-manager/alacritty.nix
      ./home-manager/cava.nix
      ./home-manager/git.nix
      ./home-manager/fzf.nix
      ./home-manager/rofi.nix
      ./home-manager/picom.nix
      ./home-manager/readline.nix
      ./home-manager/starship.nix
      ./home-manager/tmux.nix
      ./home-manager/vim.nix
      ./home-manager/xdg.nix
      ./home-manager/xsession.nix
      ./home-manager/yazi.nix
      ./home-manager/zsh.nix
    ];

}
