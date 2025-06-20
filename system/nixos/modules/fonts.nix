#--- fonts configuration / NixOS

{ pkgs, ... }: {

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
