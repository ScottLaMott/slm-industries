#----------------------------------------------------------
#---
#--- neomutt configuration / home-manager
#---

{ config, lib, pkgs, modulesPath, ... }: {

  programs.neomutt = {
    # enable = false;
    enable = true;
    sidebar.enable = true;
    sidebar.width = 22;
    extraConfig = ''
      # set sidebar_visible
      # set sidebar_format = "%B%<F? [%F]>%* %<N?%N/>%S"
      # set mail_check_stats
      # set smtp_url = "smtp://ctimmer.os@smtp.gmail.com:587/"
      # set spoolfile = "imaps://ctimmer.os@gmail.com@imap.domain.com/"

      set imap_user = ctimmer.os@imap.gmail.com
      set imap_pass = omozuwa22Zwei
      set spoolfile = +INBOX
      mailboxes = +INBOX
    '';
  };

}
