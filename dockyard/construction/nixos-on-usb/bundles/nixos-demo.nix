{pkgs, ...}: {
  networking.hostName = "usb-demo";

  environment.systemPackages = with pkgs; [
    # NixOS-Showcase
    neofetch
    nix-tree

    # Netzwerk-Demo
    tcpdump
    iperf3
    netcat-openbsd
    traceroute
    whois

    # Präsentation
    cowsay
    figlet
    lolcat
  ];

  environment.etc."motd".text = ''

    ┌─────────────────────────────────────────┐
    │           NixOS Demo System             │
    ├─────────────────────────────────────────┤
    │  neofetch          Systeminfo           │
    │  nix repl          Nix REPL             │
    │  nix-tree          Nix Store Explorer   │
    │  nmap / tcpdump    Netzwerk-Tools        │
    └─────────────────────────────────────────┘

  '';

  # figlet-Begrüßung bei Login via zsh
  programs.zsh.interactiveShellInit = ''
    if [[ -o login ]]; then
      ${pkgs.figlet}/bin/figlet -f slant "NixOS" | ${pkgs.lolcat}/bin/lolcat
    fi
  '';
}
