FROM ubuntu:xenial

MAINTAINER avastmick <avastmick.outlook.com>

WORKDIR /usr/local/repos

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    curl \
    file \ 
    git \
    libffi-dev libxslt1-dev libssl-dev libxml2-dev \
    openssl \
    python python-dev python-pip python-setuptools \
    sudo \
    uuid-dev \
    unzip \
    wget && \
    apt-get clean
