###########################################
#
#   ubunt/jammy
#   - base package

FROM jammy:init
LABEL tag     = base-packed
LABEL version = 0.1

#RUN apt install -y bat
RUN apt upgrade -y binutils
RUN apt upgrade -y build-essential
RUN apt upgrade -y curl
RUN apt upgrade -y fd-find
RUN apt upgrade -y fzf
RUN apt upgrade -y git
RUN apt upgrade -y less
RUN apt upgrade -y man-db
RUN apt upgrade -y neofetch
RUN apt upgrade -y net-tools
RUN apt upgrade -y neovim
RUN apt upgrade -y nmap
RUN apt upgrade -y openssh-server
RUN apt upgrade -y python3-pip
RUN apt upgrade -y ripgrep
RUN apt upgrade -y software-properties-common
RUN apt upgrade -y sudo
RUN apt upgrade -y silversearcher-ag
RUN apt upgrade -y xsel
RUN apt upgrade -y zsh

