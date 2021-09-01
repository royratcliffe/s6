FROM ubuntu:latest

# http://skarnet.org/software/s6/index.html
# https://github.com/just-containers/s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer
RUN /tmp/s6-overlay-amd64-installer /
ENTRYPOINT [ "/init" ]

# Use this to update package lists when APT reports that the release
# files are not valid yet.
#
#   -o Acquire::Check-Valid-Until=false
#   -o Acquire::Check-Date=false
#
RUN >> /etc/apt/apt.conf.d/90acquire echo 'Acquire::Check-Valid-Until "false";'
RUN >> /etc/apt/apt.conf.d/90acquire echo 'Acquire::Check-Date "false";'
RUN apt-get update

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:swi-prolog/devel
RUN apt-get update
RUN apt-get install -y swi-prolog

COPY swipl/ /etc/services.d/swipl/

# Text files have carriage-return and line-feed endings on Windows if
# Git on Windows has translated the line endings to `crlf` style when
# checking out the repo sources. Use `dos2unix` to convert them to
# Linux-compatible line-feed only endings. Install the tool first; use
# `find` and `xargs` to find all the files and convert to line-feed
# endings.
RUN apt-get install -y dos2unix
RUN dos2unix `find /etc/services.d/* | xargs`
