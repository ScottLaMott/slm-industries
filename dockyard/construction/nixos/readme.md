# Der Plan

## Das Git
- gemeinsames git-repo aufbauen
  - Vorteil
  kann auf hostsystemen und in vm's gelesen und verarbeitet werden

## VM bauen
- mit Script
  - VM vorbereiten. VM muß auf Hostsystem gebaut werden. Host ist z.Z ein LinuxMint
  - ssh in Hostsystem mit
  <br><br>
    ```
    # ssh christoph@192.168.122.1
    ```
  - Aufruf virsh-shell
    ```
    # virsh -c qemu:///system
    ```
  - mit _virt-install_ neue VM für Enterprise-Raumschiff erstellen.
  - Scripte in diesem Verzeichnis erstellen und mit scp-Befehl auf Hostsystem kopieren
<br><br>
- mit GUI
  - qemu/kvm VM mit GUI (virt-manager) erstellen
  - NixOS in VM installieren

- enterprise bauen

## Fragen
- Hostsystem (hier tiger)
  - warum funktioniert virsh nicht? (virsh list --all -> keine Anzeige, slm-nios-vm läuft aber)
  - virsh -c qemu:///system list --all -> ergibt Anzeige
    - falsche domain (system / user)
