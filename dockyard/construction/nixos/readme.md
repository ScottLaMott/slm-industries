# der Plan

- Virtuelle Maschine bauen
  - VM vorbereiten. VM muß auf Hostsystem gebaut werden. Host ist z.Z ein LinuxMint
  - qemu/kvm VM mit Script erstellen
    - qemu/kvm VM erstellen
      - 4 CPU
      - 50G Plattenplatz
  - qemu/kvm VM mit GUI (virt-manager) erstellen

  - NixOS in VM installieren

- enterprise bauen

## Fragen
- Hostsystem (hier tiger)
  - warum funktioniert virsh nicht? (virsh list --all -> keine Anzeige, slm-nios-vm läuft aber)
    - falsche domain? (system - user)
