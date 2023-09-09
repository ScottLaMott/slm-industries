## Snapshots
#### Snapshot 'enterprise-base` erzeugt, mit
  - Benutzer 'slm/x` erzeugt
    - in wheel-group, wg. sudo ..
    - ssh-key nicht hinterlegt
  - Benutzer 'root/x` erzeugt
  - ip-addresse  192.168.122.113
  - openssh-server installiert, wird während des booten gestartet
  - man-db installiert
  - python installiert
  - ranger installiert

#### Snapshot 'enterprise-base-1` erzeugt, mit
  - Benutzer 'root/x` erzeugt
    - mit ansible, playbook ist ansible/playbooks/config-root.yaml
    - ssh-key hinterlegt
