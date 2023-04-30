#--- enterprise -----------------------------------------------------

{ config, pkgs, ... }: {

  #--- virtualisation configuration
  virtualisation.vmVariant = {
    # following configuration is added only when building VM with build-vm
    virtualisation = {
      memorySize =  5120;         # MiB memory.
      cores = 3;
      resolution = { x = 1600; y = 900; };
      qemu.options = [ "-vga virtio -display sdl,gl=on -cpu host -enable-kvm" ];
    };
  };

  system.stateVersion               = "22.05"; # Did you read the comment?

  #--- enable networking
  networking.hostName = "enterprise-0-1";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.utf8";

  #--- console configuration
  console.keyMap = "de";

  #--- packages installed in system profile
  environment.systemPackages = with pkgs; [
    alacritty brave btop curl fd file fzf gdu git htop
    killall lf lsd nmap neofetch neovim
    ranger ripgrep screen silver-searcher speedtest-cli
    tcpdump tmux tree tldr vim
    wget zsh
    stdenv
  ];

  #--- openSSH configuration
  services.openssh.enable = true;

  #--- xserver configuration
  services.xserver = {
    #--- enable the X11 windowing system.
    enable = true;
    resolutions = [ { x = 1600; y = 900; } ];
    #--- configure keymap in X11
    layout = "de";
    xkbVariant = "";
    #--- enable login manager
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "none+awesome";
    #--- enable window manager
    windowManager.awesome.enable = true;
    #--- enable desktop manager
    desktopManager.cinnamon.enable = true;
  };

  #--- user configuration
  users.users.slm = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Scott LaMott";
    extraGroups = [ "networkmanager" "wheel" ];
    password =  "x";
  };

  users.users.kirk = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "James D. Kirk";
    extraGroups = [ "networkmanager" "wheel" ];
    password =  "k";
  };

  users.users.scotty = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Montgomery Scott";
    extraGroups = [ "networkmanager" "wheel" ];
    password =  "s";
  };

  #--- zsh configuration
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    histSize = 1000000;
    interactiveShellInit = ''
      bindkey -v
    '';
    promptInit = ''
      autoload -U promptinit && promptinit && prompt oliver && setopt prompt_sp
    '';
    shellAliases = {
      c   = "clear";
      nf  = "neofetch";
      pg  = "pgrep -fl";
      sd  = "sudo shutdown now";
      tks = "tmux kill-session";
      trs = "tmux rename-session";
      trw = "tmux rename-window";
    };
  };

  #--- tmux configuration
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 1;
    shortcut = "a";
    extraConfig = ''
      set-option -g status-left-length 20
    '';
    plugins = [
      pkgs.tmuxPlugins.gruvbox
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.continuum
    ];
  };

}
