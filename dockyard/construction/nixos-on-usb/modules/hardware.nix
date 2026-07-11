{...}: {
  # USB-Stick braucht diese Module im initrd um zu booten
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ehci_pci"
    "ahci"
    "usb_storage"
    "sd_mod"
    "uas"
  ];

  boot.loader.systemd-boot.enable = true;
  # Nicht die EFI-Variablen des Host-Systems überschreiben
  boot.loader.efi.canTouchEfiVariables = false;

  fileSystems."/" = {
    device = "/dev/disk/by-label/USB_ROOT";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/USB_EFI";
    fsType = "vfat";
    options = ["umask=0077"];
  };
}
