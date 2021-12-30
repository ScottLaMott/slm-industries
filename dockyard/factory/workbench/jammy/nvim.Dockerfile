###############################################
#
#   debian/jammy
#   - container for neovim-test 
#

FROM jammy:base-packed
LABEL tag     = lvim
LABEL version = 0.1

RUN apt install -y nodejs
#RUN apt install -y npm
RUN apt install -y python3-pip

