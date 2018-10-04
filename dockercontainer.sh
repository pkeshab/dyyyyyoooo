#!/bin/bash

# Build the docker image from dockerfile to add jenkins to sudoers and give jenkins the access

sleep 3
docker build -t myjenkins1 <location of the dockerfile>

# lets check the docker images

sleep 3
docker images

# lets run the docker container of this image now

sleep 3

docker run -d -v /var/run/docker.sock:/var/run/docker/sock -v $(which docker):/usr/bin/docker -p 8080:8080 

# docker container is run in which jenkins is running and port is mapped to 8080 of the host, we can browse to browser to check the jenkins running

sleep 3

After you login to jenkins make sure all plugins are updated then go to jenkins container shell and update one package..

apt-get install -y libltdl7 ( This will sometimes obstruct in running docker containers in jenkin)

Then go to the jenkins shell and run sudo docker info to check if docker commands can be run in it.

The content of dockerfile used here is as below::
.............................................................
FROM jenkins/jenkins:lts
USER root
RUN apt-get update \
        && apt-get install -y sudo \
        && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
..................................................................

At this point of time you should be able to run docker commands inside the jenkins server shell ...chill out.....


