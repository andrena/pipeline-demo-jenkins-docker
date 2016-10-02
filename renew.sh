#!/bin/bash -e
set +e
docker stop demo_jenkins
docker rm demo_jenkins
set -e
sh ./build.sh
sh ./run_jenkins.sh
docker start demo_jenkins

