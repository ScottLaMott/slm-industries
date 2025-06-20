#----------------------------------------------------------
#---
#--- tlp configuration
#---

{ ... }: {

  services.tlp = {
    enable=true;

    settings = {    # https://linrunner.de/tlp/introduction.html
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 30;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 75; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 95; # 80 and above it stops charging
      START_CHARGE_THRESH_BAT1 = 65; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT1 = 95; # 80 and above it stops charging
    };
  };

}

