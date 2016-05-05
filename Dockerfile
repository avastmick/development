FROM ubuntu:xenial

MAINTAINER avastmick <avastmick.outlook.com>

WORKDIR /usr/local/repos

RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential python openssl ca-certificates libssl-dev uuid-dev curl git sudo file && \
    apt-get clean
