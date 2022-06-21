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
RUN apt-get install -y git git-core build-essential cmake autoconf automake \
                                    libtool pkg-config libglib2.0-dev libzip-dev \
                                    python3-dev qtbase5-dev qtchooser qt5-qmake \
                                    qtbase5-dev-tools qtbase5-dev libboost-dev \
                                    libboost-test-dev check libfftw3-dev

# Setting up the user
VOLUME "$APP_HOME"
VOLUME "$APP_HOME/dsview"
RUN ln -s "$APP_HOME" "/home/$USER"

RUN groupadd -g "$GID" -r "$USER"
RUN useradd -u "$UID" -g "$GID" -r "$USER"

RUN chown "$USER:$USER" "$APP_HOME"
RUN chown "$USER:$USER" "/home/$USER"

# Provisioning required configs and executables
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh

ENV LIBUSB_VERSION="master"
RUN git clone https://github.com/libusb/libusb.git --depth 1 --branch "$LIBUSB_VERSION" /tmp/libusb && \
    cd /tmp/libusb && \
    autoreconf --install && \
    mkdir build && cd build && \
    ../configure --disable-udev && make && make install && \
    ln -s /usr/local/lib/libusb-1.0.so.0 /usr/lib/libusb-1.0.so.0

ENV DSVIEW_VERSION="master"
COPY 0001-Dirty-fix-to-give-some-time-to-my-udev-script-so-it-.patch /tmp/
RUN git clone https://github.com/DreamSourceLab/DSView --depth 1 --branch "$DSVIEW_VERSION" /tmp/DSView && \
    cd /tmp/DSView && \
    git config --local user.email "author@example.com" && git config --local user.name "A U Thor" && \
    git am /tmp/0001-Dirty-fix-to-give-some-time-to-my-udev-script-so-it-.patch && \
    cmake . && make && make install

# Cleaning up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR "/home/$USER"
# Setting up entry point
USER "$USER"
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

