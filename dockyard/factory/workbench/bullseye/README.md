bullseye
===
image aus debian/bullseye
---
- init
  - openssh für config mit ansible
  - init-system-helpers für ... ???, aber wichtig
  docker build ...

- base-packed
  - howto build

- scotty mit ansible-playbook erzeugen
  - ssh-key nach scotty ~/.ssh kopieren
  - password für scotty vergeben, mit docker exec -i passwd change
  - ssh-copyid für scotty
- mit ssh scotty@bullseye anmelden
