FROM ubuntu:xenial

MAINTAINER avastmick <avastmick.outlook.com>

# To run locally:
# docker run --name python-box -i -t -v $(pwd):/usr/local/repos avastmick/development-base:python3 /bin/bash

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
    python3 python3-dev python3-pip python3-setuptools \
    sudo \
    uuid-dev \
    unzip \
    wget && \
    apt-get clean

RUN pip3 install --upgrade setuptools pip wheel && \
    pip3 install virtualenvwrapper
