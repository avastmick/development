FROM avastmick/development:base

MAINTAINER avastmick <avastmick.outlook.com>

WORKDIR /usr/local/repos

RUN apt-get update && \
    apt-get clean && \
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 7B3B09DC && \
    curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh -s -- --yes && \
    multirust default stable
