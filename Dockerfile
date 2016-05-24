FROM avastmick/development

MAINTAINER avastmick <avastmick.outlook.com>

#############################################
#
# Sets up a local Docker container to allow
# GOLANG code / application specific environments
# for development
#
###########################################

ENV AVASTMICK_HOME /home/avastmick
ENV GOPATH /home/avastmick/.go

ARG user=avastmick
ARG group=avastmick
ARG uid=1000
ARG gid=1000

# add a viable user, instead of root as some tools don't play well with root
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$AVASTMICK_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user} \
    && adduser ${user} sudo \
    && echo ${user}:temp | chpasswd \
    && chage -d 0 ${user}

RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntu-lxc/lxd-stable && \
    apt-get update && \
    apt-get install -y golang && \
    apt-get clean

# Expose a port for web application traffic (note the variation from 8080 to avoid host clashes)
EXPOSE 8088
# Set up to run in $HOME as the new $user
WORKDIR ${AVASTMICK_HOME}
USER ${user}
# Setup the $GOPATH
RUN mkdir -p ${GOPATH} && \
    export GOPATH=${GOPATH}
