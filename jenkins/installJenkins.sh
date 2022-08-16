#!/bin/bash
test ! -d /opt/jenkins && mkdir -p /opt/jenkins
cd /opt/jenkins
wget https://get.jenkins.io/war-stable/2.346.3/jenkins.war
nohup java -jar jenkins.war --httpPort=23300 > /opt/jenkins.log &
