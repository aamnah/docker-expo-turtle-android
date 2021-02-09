FROM ubuntu:latest

RUN sudo apt-get update

RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install -qq tzdata

# install JDK 8 and tools
RUN sudo apt-get install -qq curl build-essential openjdk-8-jdk-headless openjdk-8-jre git rsync

# install Node LTS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# install Turtle (Expo standalone build tool)
RUN npm install -g --unsafe-perm turtle-cli