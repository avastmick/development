FROM ubuntu:xenial

MAINTAINER avastmick <avastmick.outlook.com>

WORKDIR /usr/local/repos

RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential python openssl ca-certificates uuid-dev curl wget unzip git sudo file python-pip python-dev python-setuptools libffi-dev libxml2-dev libxslt1-dev libssl-dev && \
    apt-get clean
