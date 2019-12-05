FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt -y install php7.4

RUN apt-get -y install cmake g++ pkg-config git vim-common libwebsockets-dev libjson-c-dev libssl-dev
RUN git clone https://github.com/tsl0922/ttyd.git
WORKDIR ttyd
RUN mkdir build
WORKDIR build
RUN cmake ..
RUN make && make install

EXPOSE 8080