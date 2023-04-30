# Konstruktion

```
░░░░░░█▀▀░█▀█░▀█▀░█▀▀░█▀▄░█▀█░█▀▄░▀█▀░█▀▀░█▀▀░░░░░░░░░░░
░░░░░░█▀▀░█░█░░█░░█▀▀░█▀▄░█▀▀░█▀▄░░█░░▀▀█░█▀▀░░░░░░░░░░░
░░░░░░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░░░▀░░▀░░▀░
				powered by NixOS
```


- im Verzeichnis _nixos_ wird die enterprise auf nix-basis gebaut

Mehr Informationen in _nixos/readme.md_

```
./nixos/local:
total 4
drwxr-xr-x 2 slm users 4096  3. Okt 21:36 wallpaper

./nixos/local/wallpaper:
total 496
-rw-r--r-- 1 slm users 503908  3. Okt 21:36 Astronaut-mit-Carslberg.jpeg

./vagrant:
total 20
-rwxr-xr-x 1 slm users 261 25. Sep 01:02 make-vm.sh
-rw-r--r-- 1 slm users 129 25. Sep 01:02 readme.txt
-rw-r--r-- 1 slm users  56 25. Sep 01:02 todo.txt
-rw-r--r-- 1 slm users 611 25. Sep 01:02 Vagrantfile
-rw-r--r-- 1 slm users 597 25. Sep 01:02 Vagrantfile.enterprise-001

./vm:
total 4
-rwxr-xr-x 1 slm users 405  2. Okt 22:43 virt-install-enterprise-v0.1.sh
```

- in verzeichnis _vagrant_ erste Versuche mit vagrant (too heavy!)

- nixos-vms und virt-manager-vms pid vergleichen. 'pgrep -fla qemu'

