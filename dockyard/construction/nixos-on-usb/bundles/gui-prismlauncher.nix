{pkgs, lib, ...}: {
  imports = [./nixos-gui.nix];

  networking.hostName = lib.mkForce "usb-prismlauncher";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["papermc" "minecraft-server"];

  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;
    package = pkgs.papermc;
    serverProperties = {
      motd = "usb-prismlauncher";
      max-players = 5;
      difficulty = 1;
      online-mode = false;
    };
  };

  users.users.mc = {
    isNormalUser = true;
    description = "Minecraft";
    initialPassword = "";
    extraGroups = ["networkmanager"];
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "mc";
  };

  system.activationScripts.mc-xprofile = lib.stringAfter ["users"] ''
    cat > /home/mc/.xprofile << 'EOF'
prismlauncher &
EOF
    chown mc:users /home/mc/.xprofile
  '';

  system.activationScripts.mc-prismlauncher-account = lib.stringAfter ["users"] ''
    dir=/home/mc/.local/share/PrismLauncher
    mkdir -p "$dir/logs"
    chown -R mc:users "$dir"
    file=$dir/accounts.json
    if [ ! -f "$file" ]; then
      echo '{"accounts":[{"type":"Offline","username":"mc"}],"activeAccount":"mc","formatVersion":3}' \
        > "$file"
      chown mc:users "$file"
    fi
  '';

  environment.systemPackages = with pkgs; [
    prismlauncher
  ];
}
