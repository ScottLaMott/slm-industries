###########################################
#
#   debian/bullseye
#   - initial base container 

FROM debian:bullseye
LABEL tag     = init
LABEL version = 0.1

RUN apt update
RUN apt upgrade -y

###
RUN apt-get upgrade -y init-system-helpers
RUN apt-get upgrade -y iputils-ping
RUN apt upgrade -y locales-all
RUN apt upgrade -y openssh-server
RUN apt upgrade -y python
RUN apt upgrade -y vim
RUN apt upgrade -y zsh

RUN apt upgrade -y apt-file
RUN apt-file update

# wichtige files
COPY ./files/bashrc       /root/.bashrc
COPY ./files/id_rsa.pub   /root/.ssh/authorized_keys
COPY ./files/sshd_config  /etc/ssh/sshd_config

# starte ssh-service, aber nur bei docker build!!?
RUN echo "service ssh start !! ?? !! "

