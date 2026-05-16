{ ... }: {
  programs.ssh = {
    enable = true;
    matchBlocks."*" = {
      extraOptions.ForwardX11 = "no";
    };
  };
}
