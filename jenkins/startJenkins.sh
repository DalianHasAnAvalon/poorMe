#!/bin/bash
cd /opt/jenkins
nohup java -jar jenkins.war --httpPort=23300 > jenkins.log &
