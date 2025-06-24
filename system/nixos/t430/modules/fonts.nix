#--- fonts configuration / NixOS

{ pkgs, ... }: {

  fonts.packages = with pkgs; [
    # nerd-fonts._0xproto
    nerd-fonts.fira-code
    # nerd-fonts.mononoki
    # nerd-fonts.lekton
    # nerd-fonts.victor-mono
    # nerd-fonts.profont
  ];
}
