enterprise-bullseye
===
enterprise aus debian/bullseye-image
---
- bullseye-init
  - openssh für config mit ansible
  - init-system-helpers für ... ???, aber wichtig
  docker build ...

- bullseye-base-packed
  - howto build

- scotty mit ansible-playbook erzeugen
- password für scotty vergeben, mit docker exec -i passwd change
- ssh-copyid für scotty
- mit ssh scotty@enterprise anmelden
