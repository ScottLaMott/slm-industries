###########################################
#
#   debian/bullseye
#   - very small base package
#   - ssh von becks als root

FROM debian:bullseye

RUN apt update
RUN apt upgrade -y

# important
RUN apt upgrade -y init-system-helpers
# important
RUN apt upgrade -y openssh-server
RUN apt upgrade -y python
RUN apt upgrade -y vim
RUN apt upgrade -y zsh
RUN apt upgrade -y apt-file
RUN apt-file update


COPY ./id_rsa.pub   /root/.ssh/authorized_keys
COPY ./sshd_config  /etc/ssh/sshd_config

# starte ssh-service, aber nur bei docker build!!?
RUN service ssh status

