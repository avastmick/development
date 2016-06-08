FROM avastmick/development

MAINTAINER avastmick <avastmick.outlook.com>

ENV AVASTMICK_HOME /home/avastmick

ARG user=avastmick
ARG group=avastmick
ARG uid=1000
ARG gid=1000

# add a viable user, instead of root as some tools don't play well with root
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$AVASTMICK_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user} \
    && adduser ${user} sudo \
    && echo ${user}:temp | chpasswd

RUN apt-get update && \
    apt-get clean && \
    curl https://sh.rustup.rs -sSf | sh -s -- --yes && \
    multirust default stable

# Expose a port for web application traffic (note the variation from 8080 to avoid host clashes)
EXPOSE 8088
# Set up to run in $HOME as the new $user
WORKDIR ${AVASTMICK_HOME}
USER ${user}

RUN multirust default stable
