#!/usr/bin/zsh
#
# bastelt ein vagrant-vm zusammen
#
#

# grundsystem
ansible-playbook playbooks/fvs.yaml          -i hosts -l enterprise -e 'hostname=enterprise'

# root konfigurieren
ansible-playbook playbooks/config-root.yaml  -i hosts -l enterprise

# benutzer konfigurieren
ansible-playbook playbooks/add-user.yaml     -i hosts -l enterprise -e 'username=kirk' -e 'fullname=James D. Kirk' -e 'home=/home/kirk'
ansible-playbook playbooks/add-user.yaml     -i hosts -l enterprise -e 'username=scotty' -e 'fullname=Montgomery Scott' -e 'home=/home/scotty'

# fzf installieren konfigurieren
ansible-playbook playbooks/fzf-fuzzy.yaml    -i hosts -l enterprise


