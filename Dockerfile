# KICAD_VERSION=7.0
# docker build -t kicad:${KICAD_VERSION} . --build-arg KICAD_VERSION=${KICAD_VERSION}
# docker run -it --rm -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/home/ubuntu/.Xauthority --network host kicad:${KICAD_VERSION}

FROM ubuntu:22.04
ARG KICAD_VERSION=0.7

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository --yes ppa:kicad/kicad-${KICAD_VERSION}-releases && \
    apt-get update && \
    apt-get install -y --install-recommends kicad

RUN useradd -g users -G sudo -m -s /bin/bash ubuntu && \
    echo 'ubuntu:foobar' | chpasswd
RUN echo 'Defaults visiblepw'            >> /etc/sudoers
RUN echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ubuntu

CMD kicad
