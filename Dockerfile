FROM debian:stable-slim

ENV VAGRANT_VERSION 2.2.1

RUN apt-get update \
 && apt-get install -y curl build-essential rsync openssh-client git \
 && curl -O https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb \
 && dpkg -i vagrant_${VAGRANT_VERSION}_x86_64.deb \
 && rm vagrant_${VAGRANT_VERSION}_x86_64.deb \
 && apt-get clean

RUN vagrant plugin install vagrant-aws \
 && vagrant plugin install vagrant-serverspec
