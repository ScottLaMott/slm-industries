#
# debian/bullseye mit base package
#
FROM base-packed:latest
LABEL tag     = lvim
LABEL version = 0.1

#RUN apt install -y bat
RUN apt install -y cargo
RUN apt install -y cmake
RUN apt install -y gettext
RUN apt install -y libtool
RUN apt install -y libtool-bin
RUN apt install -y nodejs
RUN apt install -y npm
RUN apt install -y pkgconf
RUN apt install -y python3-pip
RUN apt install -y zip

