#FROM zshusers/zsh
FROM bullseye:latest

RUN apt install -y atop
RUN apt install -y ipcalc
RUN apt install -y figlet
RUN apt install -y nmap
RUN apt install -y tmux
RUN apt install -y toilet
# problem
#RUN apt install -y tshark


