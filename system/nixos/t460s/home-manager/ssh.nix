#----------------------------------------------------------
#---
#--- ssh configuration / home-manager
#---
{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        ForwardX11 = "no";
      };
      "github.com" = {
        HostName = "ssh.github.com";
        Port = 443;
      };
    };
  };
}
