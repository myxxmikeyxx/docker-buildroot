FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    bash \
    bc \
    binutils \
    build-essential \
    bzip2 \
    cpio \
    g++ \
    gcc \
    git \
    gzip \
    locales \
    libncurses5-dev \
    libdevmapper-dev \
    libsystemd-dev \
    make \
    mercurial \
    whois \
    patch \
    perl \
    python \
    rsync \
    sed \
    tar \
    vim \ 
    unzip \
    wget \
    bison \
    flex \
    libssl-dev \
    libfdt-dev

RUN locale-gen en_US.utf8

RUN git clone git://git.buildroot.net/buildroot --depth=1 --branch=2024.05 /root/buildroot

WORKDIR /root/buildroot

ENV O=/buildroot_output

RUN touch .config
RUN touch kernel.config

VOLUME /root/buildroot/dl
VOLUME /buildroot_output

ENV FORCE_UNSAFE_CONFIGURE=1
RUN set FORCE_UNSAFE_CONFIGURE=1

RUN ["/bin/bash"]
