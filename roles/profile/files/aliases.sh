#!/bin/bash

alias dc="docker-compose"
alias d="docker"
alias docker-wipe="docker rm -f $(docker ps -a -q);  docker rmi -f $(docker images -q)"
