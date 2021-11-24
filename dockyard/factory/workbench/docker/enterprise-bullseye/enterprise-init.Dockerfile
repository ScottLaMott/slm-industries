#
# debian/buster mit base package
#

FROM debian:bullseye

RUN apt update
RUN apt upgrade -y

###
RUN apt upgrade -y apt-file
RUN apt-file update
