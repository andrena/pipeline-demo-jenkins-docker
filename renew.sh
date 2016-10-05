#!/bin/bash -e
set +e
docker stop demo_jenkins
docker rm demo_jenkins
set -e
sh ./build.sh
docker create -p 80:8080 --name demo_jenkins -v /var/run/docker.sock:/var/run/docker.sock -v /home/thomas/.ssh:/var/jenkins_home/.ssh -v /home/thomas/jenkins:/var/jenkins_home demo_jenkins 
docker start demo_jenkins

