FROM abernix/meteord:base

MAINTAINER avastmick <avastmick.outlook.com>

###########################################
#
# Sets up a local Docker container to allow
# code / application specific environments
# for development
#
###########################################

ENV HOME /src
ARG user=avastmick
ARG group=avastmick
ARG uid=1000
ARG gid=1000

# add a viable user, instead of root as some tools don't play well with root
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user} \
    && adduser ${user} sudo \
    && echo ${user}:temp | chpasswd

#
USER ${user}
# This is where any repositories should be mounted
WORKDIR ${HOME}

ENV TINI_VERSION 0.16.1
# ${TINI_VERSION}

# Use tini as subreaper in Docker container to adopt zombie processes
RUN curl -fsSL https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static -o /bin/tini && chmod +x /bin/tini 

ENTRYPOINT ["/bin/tini", "--"]
