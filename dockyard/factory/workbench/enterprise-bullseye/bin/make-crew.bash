#!/bin/bash

ansible-playbook -e username=kirk   -e fullname='James T. Kirk/Captain'    -e home=/home/kirk   -i hosts -l enterprise-container playbooks/add-user.yaml
ansible-playbook -e username=scotty -e fullname='Montgomery Scott' -e home=/home/scotty -i hosts -l enterprise-container playbooks/add-user.yaml
ansible-playbook -e username=spok   -e fullname='Spok/Commander'             -e home=/home/spoke  -i hosts -l enterprise-container playbooks/add-user.yaml
ansible-playbook -e username=pille  -e fullname='McCoy'            -e home=/home/pille  -i hosts -l enterprise-container playbooks/add-user.yaml
ansible-playbook -e username=uhura  -e fullname='Uhura'            -e home=/home/uhura  -i hosts -l enterprise-container playbooks/add-user.yaml
ansible-playbook -e username=sulu   -e fullname='Sulu'             -e home=/home/sulu   -i hosts -l enterprise-container playbooks/add-user.yaml
