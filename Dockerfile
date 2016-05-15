FROM avastmick/development

MAINTAINER avastmick <avastmick.outlook.com>

# To run locally:
# docker run --name python-box -i -t -v $(pwd):/usr/local/repos avastmick/development:python /bin/bash
ENV AVASTMICK_HOME /usr/local/repos

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

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    python python-dev python-pip python-setuptools \
    python3 python3-dev python3-pip python3-setuptools virtualenvwrapper \
    && \
    apt-get clean

RUN pip3 install --upgrade setuptools pip wheel

# Expose a port for web application traffic (note the variation from 8080 to avoidn host clashes)
EXPOSE 8088
# Set up to run in $HOME as the new $user
WORKDIR ${AVASTMICK_HOME}
USER ${user}
