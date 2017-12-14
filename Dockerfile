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

RUN bash $METEORD_DIR/lib/install_meteor.sh

# USER ${user}
# This is where any repositories should be mounted
WORKDIR ${HOME}

ENTRYPOINT ["/bin/tini", "--"]
