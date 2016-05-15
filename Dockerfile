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
    nano \
    openssl \
    sudo \
    uuid-dev \
    unzip \
    wget && \
    apt-get clean
