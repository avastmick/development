# development

A set of Docker images to simplify local development.

The idea is that you don't need to install any development tools on your machine, just an editor. Then use a local Docker to run containers with the required development environment for your code: a container for each raget language.

## potential issues

- Editor integration. The editor may require local access to language specific functions locally; for example, for linters etc.


# image ordering:


|image name |installed|notes|
|:---|:---|:---|
|``ubuntu:xenial``|Ubuntu 16.04|Base image
|``avastmick/development:base``|standard tools|The base image|
|``avastmick/development:python``|python tools|Typical python dev tooling|
|``avastmick/development:rust``|multirust||


## branches

1. ``master``: ``master`` is a basic Ubuntu:Xenial image with Git, SSH etc. [TODO list out]
2. ``python``: ``python`` is built on ``base`` with a multienv python installation
3. ``rust`` : ``rust`` is built upon the base with multirust installed
