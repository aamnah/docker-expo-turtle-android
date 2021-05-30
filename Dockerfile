FROM ubuntu:21.04

LABEL description="Base image for building standalone Expo apps using Turtle CLI"
LABEL author="Aamnah"
LABEL version="0.1"

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt update -qq && apt-get install -y -qq \ 
    tzdata \
    curl \
    git \
    rsync \
    build-essential \
    openjdk-8-jdk-headless

# Install Node with nvm
ARG NODE_VERSION=14.17.0
ENV NVM_DIR=/root/.nvm
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash  \
    && . ${NVM_DIR}/nvm.sh \
    && . ${NVM_DIR}/bash_completion \
    && echo "\n npm version is: $(npm -v)" \
    && echo "\n Node version is: $(node -v)"

# Install Expo CLI and Turtle (Expo standalone build tool)
RUN npm i -g --unsafe-perm expo-cli turtle-cli

# Install misc. tools for app distribution, testing and releases
RUN npm i -g netlify-cli \
             appcenter-cli \ 
             firebase-tools

# Cleanup
RUN apt update && apt autoremove -y

CMD bash
