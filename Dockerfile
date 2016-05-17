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
    nano \
    openssl \
    sudo \
    supervisor \
    uuid-dev \
    unzip \
    wget && \
    apt-get clean && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d

ADD supervisor.conf /etc/supervisor.conf

# default command
CMD ["supervisord", "-c", "/etc/supervisor.conf"]
