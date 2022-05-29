FROM ubuntu:22.04

MAINTAINER Rafael Waldo Delgado Doblas

# Initial Setup
ARG UID=1000
ARG GID=1000
ARG USER="ondocker"
ENV APP_HOME="/App_Home"

ENV DEBIAN_FRONTEND="noninteractive"

# Installing Dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git git-core build-essential cmake autoconf automake           libtool pkg-config libglib2.0-dev libzip-dev libudev-dev           libusb-1.0-0-dev python3-dev qtbase5-dev qtchooser           qt5-qmake qtbase5-dev-tools qtbase5-dev libboost-dev           libboost-test-dev check libfftw3-dev

# Setting up the user
VOLUME "$APP_HOME"
VOLUME "$APP_HOME/dsview"
RUN ln -s "$APP_HOME" "/home/$USER"
WORKDIR "/home/$USER"

RUN groupadd -g "$GID" -r "$USER"
RUN useradd -u "$UID" -g "$GID" -r "$USER"
RUN adduser "$USER" -G __GROUPS__

RUN chown "$USER:$USER" "$APP_HOME"
RUN chown "$USER:$USER" "/home/$USER"

# Provisioning required configs and executables
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh

# Keeping update the image
RUN apt-get update && apt-get upgrade -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setting up entry point
USER "$USER"
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

