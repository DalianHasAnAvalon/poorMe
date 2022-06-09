#!/bin/bash
# Add agents ssh keys to master
# This shell assume that user log in with root and use the init.sh to init the jenkins.
# Type in your agent nodes ips in parameter $1 and $2
# author kraken 
cd ~
if [ ! -d ".ssh" ]; then
  mkdir .ssh
fi
cd .ssh/
if [ $1 ]; then
  ssh-keyscan -H $1 >> known_hosts
fi
if [ $2 ]; then
  ssh-keyscan -H $1 >> known_hosts
fi