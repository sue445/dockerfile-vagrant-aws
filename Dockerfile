FROM debian:buster-slim

RUN apt-get update \
 && apt-get install -y curl build-essential rsync openssh-client git \
 && apt-get clean

ENV VAGRANT_VERSION 2.4.0

RUN curl -O https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}-1_amd64.deb \
 && dpkg -i vagrant_${VAGRANT_VERSION}-1_amd64.deb \
 && rm vagrant_${VAGRANT_VERSION}-1_amd64.deb

RUN /opt/vagrant/embedded/bin/gem install json --version 2.7.1

RUN vagrant plugin install vagrant-aws --debug --verbose \
 && vagrant plugin install vagrant-serverspec
