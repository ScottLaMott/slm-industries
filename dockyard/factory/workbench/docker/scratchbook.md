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

- based-packed und full-packed container in der erprobungsphase
