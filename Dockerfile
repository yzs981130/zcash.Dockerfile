FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
      build-essential \
      pkg-config \
      libc6-dev \
      m4 \
      g++-multilib \
      autoconf \
      libtool \
      ncurses-dev \
      unzip \
      git \
      python \
      python-zmq \
      zlib1g-dev \
      curl \
      bsdmainutils \
      automake \
&& apt-get clean

WORKDIR /root/
RUN git clone https://github.com/zcash/zcash.git
WORKDIR /root/zcash/
RUN git checkout v3.0.0
RUN ./zcutil/fetch-params.sh

RUN ./zcutil/build.sh -j$(nproc)
