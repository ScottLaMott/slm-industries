+++
=

wie wird es gemacht (allgemein)
-
- docker image aus internet downloaden
- Dockerfile erstellen (docker init ???check)
- container erstellen (docker build ???check)
- container starten (docker run ???check, default login als root)

wie wird es gemacht (enterprise-bauplan)
- docker image aus internet downloaden (ubuntu/focal)
- ubuntu base image bauen (ubuntu/focal)

die erste Enterprise
-
- Dockerfile.enterprise-becks-dc-001, die erste enterprise
  - ein Image aus der Workbench
  - docker build .
  - docker run -i -t container-id
  - dotbare in user kirk installieren
      ```
      git clone https://github.com/kazhala/dotbare.git ~/.dotbare
      dotbare finit -u https://github.com/ScottLaMott/.cfg
      ```
  - vim plugin manager ???

- based-packed und full-packed container in der erprobungsphase


die zweite Enterprise
---
- docker build mit image aus dockerhub (debian:bullseye)
- docker build mit image aus dockerhub (debian:bullseye)

