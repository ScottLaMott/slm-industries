FROM zshusers/zsh

RUN apt update
RUN apt upgrade

RUN apt install -y \
  fzf \
  git \
  tmux \
  openssh-server \
  neovim

RUN git clone https://github.com/kazhala/dotbare.git ~/.dotbare
#RUN hostname debian-container must be root ????

RUN adduser \
  --gecos 'James T. Kirk' \
  --shell '/usr/bin/zsh' \
  --disabled-login \
  kirk

COPY ./.bashrc      /home/kirk
COPY ./.profile     /home/kirk
COPY ./.zshrc       /home/kirk

COPY ./.bashrc      /root/
COPY ./.profile     /root/
COPY ./.zshrc       /root/
COPY ./.tmux.conf   /root/
COPY nvim           /root/.config/nvim/
COPY plugins        /root/.local/plugins/
