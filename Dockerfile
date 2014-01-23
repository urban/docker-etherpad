# Etherpad
#
# VERSION 0.1

# use the ubuntu base image provided by dotCloud
FROM ubuntu
MAINTAINER Urban "http://urbanfaubion.com"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install etherpad system dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gzip git-core curl python-software-properties python g++ make libssl-dev pkg-config build-essential

# install node.js
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs

# install etherpad
RUN (cd /opt && git clone git://github.com/ether/etherpad-lite.git etherpad && cd etherpad && ./bin/installDeps.sh)

# install supervisor
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor

# add etherpad settings
ADD settings.json /opt/etherpad/settings.json

# add supervisor settings
ADD supervisor.conf /etc/supervisor/supervisor.conf

# expose container at port 9001
EXPOSE 9001

# start etherpad using supervisor
CMD ["supervisord", "-c", "/etc/supervisor/supervisor.conf", "-n"]
