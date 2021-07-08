FROM debian:stable-slim

RUN apt-get update \
 && apt-get install -y curl build-essential rsync openssh-client git \
 && apt-get clean

ENV VAGRANT_VERSION 2.2.17

RUN curl -O https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb \
 && dpkg -i vagrant_${VAGRANT_VERSION}_x86_64.deb \
 && rm vagrant_${VAGRANT_VERSION}_x86_64.deb

RUN vagrant plugin install vagrant-aws \
 && vagrant plugin install vagrant-serverspec
