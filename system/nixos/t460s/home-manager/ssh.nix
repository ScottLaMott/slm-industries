{ ... }: {
  programs.ssh = {
    enable = true;
    matchBlocks."github.com" = {
      forwardX11 = false;
    };
  };
}
