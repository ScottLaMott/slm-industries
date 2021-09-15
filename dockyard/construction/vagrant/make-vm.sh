###################################################
#!/bin/bash
#
# erzeugt eine VM mit vagrant, provider ist libvirt
#

vagrant up --provider=libvirt
vagrant ssh -c 'sudo apt update'
vagrant ssh -c 'sudo apt -y upgrade'
vagrant ssh -c 'sudo apt -y autoremove'
