FROM abernix/meteord:base

MAINTAINER avastmick <avastmick.outlook.com>

###########################################
#
# Sets up a local Docker container to allow
# code / application specific environments
# for development
#
###########################################

# This is where any repositories should be mounted
WORKDIR /src


ENV TINI_VERSION v0.16.1
# ${TINI_VERSION}

# Use tini as subreaper in Docker container to adopt zombie processes
RUN curl -fsSL https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static -o /bin/tini && chmod +x /bin/tini 

ENTRYPOINT ["/bin/tini", "--"]
