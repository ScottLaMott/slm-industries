#!/usr/bin/zsh
#
# bastelt ein vagrant-vm zusammen
#
#

# grundsystem
ansible-playbook ubuntu-focal/fvs.yaml          -i hosts -l slm-vagrant-20 -e 'hostname=voyager'
# root konfigurieren
ansible-playbook ubuntu-focal/config-root.yaml  -i hosts -l slm-vagrant-20
# benutzer konfigurieren
ansible-playbook ubuntu-focal/add-user.yaml     -i hosts -l slm-vagrant-20 -e 'username=kirk' -e 'fullname=James D. Kirk' -e 'home=/home/kirk'
ansible-playbook ubuntu-focal/add-user.yaml     -i hosts -l slm-vagrant-20 -e 'username=scotty' -e 'fullname=Montgomery Scott' -e 'home=/home/scotty'
# fzf installieren konfigurieren
ansible-playbook ubuntu-focal/fzf-fuzzy.yaml    -i hosts -l slm-vagrant-20


