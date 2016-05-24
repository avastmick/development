FROM ubuntu:xenial

MAINTAINER avastmick <avastmick.outlook.com>

###########################################
#
# Sets up a local Docker container to allow
# code / application specific environments
# for development
#
###########################################

# This is where any repositories should be mounted
WORKDIR /usr/local/repos

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    curl \
    file \
    git \
    libffi-dev libxslt1-dev libssl-dev libxml2-dev \
    make \
    nano \
    openssl \
    sshfs \
    sudo \
    uuid-dev \
    unzip \
    wget && \
    apt-get clean

ENV TINI_SHA 066ad710107dc7ee05d3aa6e4974f01dc98f3888

# Use tini as subreaper in Docker container to adopt zombie processes
RUN curl -fsSL https://github.com/krallin/tini/releases/download/v0.5.0/tini-static -o /bin/tini && chmod +x /bin/tini \
  && echo "$TINI_SHA  /bin/tini" | sha1sum -c -

ENTRYPOINT ["/bin/tini", "--"]
