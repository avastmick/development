FROM avastmick/development

MAINTAINER avastmick <avastmick.outlook.com>

# To run locally:
# docker run --name python-box -i -t -v $(pwd):/usr/local/repos avastmick/development:python /bin/bash
ENV AVASTMICK_HOME /usr/local/repos

ARG user=avastmick
ARG group=avastmick
ARG uid=1000
ARG gid=1000

# Jenkins is run with user `jenkins`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$AVASTMICK_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user} \
    && adduser ${user} sudo

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    python python-dev python-pip python-setuptools \
    python3 python3-dev python3-pip python3-setuptools virtualenvwrapper \
    && \
    apt-get clean

RUN pip3 install --upgrade setuptools pip wheel

# Set up to run in $HOME as the new $user
WORKDIR ${AVASTMICK_HOME}
USER ${user}
