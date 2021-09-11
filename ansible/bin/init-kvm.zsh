#!/usr/bin/zsh
#
# bastelt ein vagrant-vm zusammen
#
#

host=kvm-20

# grundsystem
ansible-playbook playbooks/fvs.yaml          -i hosts -l $host -e "hostname=$host"

# root konfigurieren
ansible-playbook playbooks/config-root.yaml  -i hosts -l $host

# benutzer konfigurieren
ansible-playbook playbooks/add-user.yaml     -i hosts -l $host -e "username=christoph" -e "fullname=Christoph Timmmer" -e "home=/home/christoph"
ansible-playbook playbooks/add-user.yaml     -i hosts -l $host -e "username=slm"       -e "fullname=Scott LaMott"      -e "home=/home/slm"
ansible-playbook playbooks/add-user.yaml     -i hosts -l $host -e "username=ct"        -e "fullname=ct"                -e "home=/home/ct"

