#
# debian/buster mit base package
#

FROM zshusers/zsh

RUN apt update
RUN apt upgrade

#RUN apt install -y bat
RUN apt upgrade -y binutils
RUN apt upgrade -y build-essential
RUN apt upgrade -y fd-find
RUN apt upgrade -y fzf
RUN apt upgrade -y git
RUN apt upgrade -y openssh-server
RUN apt upgrade -y man-db
RUN apt upgrade -y neofetch
RUN apt upgrade -y neovim
RUN apt upgrade -y nmap
RUN apt upgrade -y ripgrep
RUN apt upgrade -y silversearcher-ag
RUN apt upgrade -y net-tools

###
RUN apt upgrade -y apt-file
RUN apt-file update


RUN apt upgrade -y less
