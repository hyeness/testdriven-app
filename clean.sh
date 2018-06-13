#!/bin/bash

# stop all running containers
docker stop $(docker ps -aq)
# remove all containers
docker rm $(docker ps -aq)
# remove all images
docker rmi $(docker images -q)
# remove all volumes
docker volume rm $(docker volume ls -qf dangling=true);