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
    apt-get clean

# Expose a port for web application traffic (note the variation from 8080 to avoid host clashes)
EXPOSE 8088
# Set up to run in $HOME as the new $user
WORKDIR ${AVASTMICK_HOME}
USER ${user}

RUN curl -sSf sh.rustup.rs | sh -s -- -y && \
    echo "export PATH=~/.cargo/bin:$PATH" >> ~/.bashrc && \
    echo "export PS1='\u:\w$ '" >> ~/.bashrc
