#!/bin/bash
# Initialize a linux(CentOS Stream 8) for Jenkins nodes, master or salves.
# parameters $1 is a string which is in [master, salve], obviously if you type in master, it will initialize a Jenkins master, on the other hand a salve node
# will be initialized
# author kraken
if [ "master" != "${1}" -a "slave" != "${1}" ]; then
    echo "The parameter \$1 must be master or slave"
    exit 1
fi
echo "a ${1} node will be initialized"

yum install -y java-1.8.0-openjdk.x86_64
if [ "master" == ${1} ]; then
    yum install -y wget
    cd /opt
    wget https://get.jenkins.io/war-stable/2.332.3/jenkins.war
    nohup java -jar jenkins.war --httpPort=23300 > /opt/jenkins.log &
fi

echo "initialize successful"
