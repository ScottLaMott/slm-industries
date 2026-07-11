{pkgs, ...}: {
  networking.hostName = "usb-demo";

  environment.systemPackages = with pkgs; [
    # NixOS-Showcase
    fastfetch
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

  security.pam.services.login.showMotd = true;

  environment.etc."motd".text = ''

    ┌─────────────────────────────────────────┐
    │           NixOS Demo System             │
    ├─────────────────────────────────────────┤
    │  fastfetch          Systeminfo           │
    │  nix repl          Nix REPL             │
    │  nix-tree          Nix Store Explorer   │
    │  nmap / tcpdump    Netzwerk-Tools        │
    └─────────────────────────────────────────┘

  '';

  # figlet-Begrüßung bei Login via zsh
  programs.zsh.interactiveShellInit = ''
    if [[ -o login ]]; then
      cat /etc/motd
      ${pkgs.figlet}/bin/figlet -f slant "NixOS" | ${pkgs.lolcat}/bin/lolcat
    fi
  '';
}
