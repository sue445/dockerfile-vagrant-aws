FROM debian:stable-slim

RUN apt-get update \
 && apt-get install -y curl build-essential rsync openssh-client git \
 && apt-get clean

ENV VAGRANT_VERSION 2.2.6

RUN curl -O https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb \
 && dpkg -i vagrant_${VAGRANT_VERSION}_x86_64.deb \
 && rm vagrant_${VAGRANT_VERSION}_x86_64.deb

# FIXME: Remove following when vagrant embed ruby is updated to 2.5+
#        (vagrant embed ruby is 2.4.9, but activesupport 6.0+ requires ruby 2.5+)
RUN vagrant plugin install activesupport --plugin-version 5.2.3 --entry-point active_support

RUN vagrant plugin install vagrant-aws \
 && vagrant plugin install vagrant-serverspec
