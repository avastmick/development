FROM avastmick/development

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

RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntu-lxc/lxd-stable && \
    apt-get update && \
    golang && \
    apt-get clean
