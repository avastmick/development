# development-base

A set of Docker images to simplify local development.

The idea is that you don't need to install any development tools on your machine, just an editor. Then use a local Docker to run containers with the required development environment for your code.

# images

- Base tag: Latest is a basic Ubuntu:Xenial image with Python, Git, SSH etc.
- Rust tag : rust is built upon the base with multirust installed 
