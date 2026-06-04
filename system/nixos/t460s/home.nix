  #--- user home-manager configuration

{ config, lib, pkgs, modulesPath, ... }: {
    # programs.zsh.enable = true;
    home.username = "slm";
    home.homeDirectory = "/home/slm";
    home.stateVersion = "23.11";
    home.packages = with pkgs; [
      atop
      figlet
      flameshot
      glow
      gdu
      hwinfo
      nitch
      nix-tree
      powerline-fonts
      theme-sh

      # yazi

      # fun, teilweise in devbox fun-box
      # cmatrix
      # sl
      # terminal-parrot

      # music
      beets
      # cava
      mixxx
      picard
      playerctl
      soco-cli
      spotify-player
      strawberry

      # minecraft
      cubiomes-viewer
      prismlauncher
      #
      lnav
      devbox
      # gns3
      gns3-server
      gns3-gui
      ubridge
      vpcs
      dynamips
    ];

    home.file = {
      ".config/tmuxp/nixos-t460s.yaml".source = ./dots/tmuxp/nixos-t460s.yaml;
      ".config/tmuxp/sandbox.yaml".source     = ./dots/tmuxp/sandbox.yaml;
      ".config/tmuxp/enterprise.yaml".source  = ./dots/tmuxp/enterprise.yaml;
      ".config/tmuxp/README.md".source        = ./dots/tmuxp/README.md;
    };

    imports = [
      ./home-manager/alacritty.nix
      ./home-manager/cava.nix
      ./home-manager/git.nix
      ./home-manager/fzf.nix
      ./home-manager/rofi.nix
      ./home-manager/neomutt.nix
      ./home-manager/picom.nix
      ./home-manager/readline.nix
      ./home-manager/starship.nix
      ./home-manager/tmux.nix
      ./home-manager/vim.nix
      ./home-manager/xdg.nix
      ./home-manager/xsession.nix
      ./home-manager/yazi.nix
      ./home-manager/zoxide.nix
      ./home-manager/pass.nix
      ./home-manager/ssh.nix
      ./home-manager/zsh.nix
    ];

}
