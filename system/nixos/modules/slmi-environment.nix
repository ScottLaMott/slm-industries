#--- environment configuration / NixOS
{ config, lib, pkgs, ... }: {

  #--- add zsh to /etc/shells
  environment.shells = with pkgs; [ zsh ];

  #--- list installed packages system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    bat brave btop
    curl
    dmenu
    ethtool
    feh fd file fzf
    git
    htop
    ipcalc
    killall
    lsd lua lua52Packages.luarocks-nix
    nmap neofetch neovim nodejs
    pulsemixer pure-prompt python
    ranger ripgrep rofi
    screen silver-searcher speedtest-cli stow sxiv
    tshark tcpdump tig tio toilet tree tldr
    wget
    xclip
    vim
    wget
    zathura
  ];

}
