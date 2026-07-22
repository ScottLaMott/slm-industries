{lib, ...}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.slm = {
    lib,
    pkgs,
    ...
  }: {
    home.username = "slm";
    home.homeDirectory = "/home/slm";
    home.stateVersion = "26.05";

    imports = [
      ../../../../system/nixos/t460s/home-manager/zsh.nix
      ../../../../system/nixos/t460s/home-manager/tmux.nix
      ../../../../system/nixos/t460s/home-manager/git.nix
      ../../../../system/nixos/t460s/home-manager/fzf.nix
      ../../../../system/nixos/t460s/home-manager/starship.nix
      ../../../../system/nixos/t460s/home-manager/readline.nix
      ../../../../system/nixos/t460s/home-manager/zoxide.nix
      ../../../../system/nixos/t460s/home-manager/alacritty.nix
      ../../../../system/nixos/t460s/home-manager/xsession.nix
      ../../../../system/nixos/t460s/home-manager/xdg.nix
      ../../../../system/nixos/t460s/home-manager/rofi.nix
      ../../../../system/nixos/t460s/home-manager/picom.nix
    ];

    # zplug tries to install plugins on first run (requires internet + user interaction)
    programs.zsh.zplug.enable = lib.mkForce false;

    # Compositor: glx-Backend und Blur brauchen GPU — in VM (QEMU) nicht verfügbar
    services.picom.backend = lib.mkForce "xrender";
    services.picom.settings.blur = lib.mkForce {};

    # Opacity ohne funktionierenden Compositor = schwarzes Fenster
    programs.alacritty.settings.window.opacity = lib.mkForce 1.0;

    # Override t460s-specific hardcoded paths
    programs.zsh.shellAliases = {
      nvim = lib.mkForce "nvim";
      prismlauncher = lib.mkForce "prismlauncher";
    };

    programs.git.settings.core.editor = lib.mkForce "nvim";

    home.packages = with pkgs; [
      fd
      bat
      nerd-fonts.fira-code
    ];
  };
}
