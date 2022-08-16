#!/bin/bash

cd /opt
test ! -d jfrog && mkdir jfrog
cd jfrog
echo 'JFROG_HOME=/opt/jfrog' >> ~/.bashrc
source ~/.bashrc
JFROG_ARTIFACTORY_FILE=$(find /opt/resources -name 'jfrog-artifactory-oss*' | awk 'NR==1{print $1}')
mv ${JFROG_ARTIFACTORY_FILE} ./${JFROG_ARTIFACTORY_FILE}
tar -zxf ${JFROG_ARTIFACTORY_FILE}
mv artifactory-* artifactory
${JFROG_HOME}/artifactory/app/bin/installService.sh
echo 'artifactory:' >> /opt/jfrog/artifactory/var/etc/system.yaml
echo '  port: 23301' >> /opt/jfrog/artifactory/var/etc/system.yaml
echo 'router:' >> /opt/jfrog/artifactory/var/etc/system.yaml
echo '  entrypoints:' >> /opt/jfrog/artifactory/var/etc/system.yaml
echo '    externalPort: 23302' >> /opt/jfrog/artifactory/var/etc/system.yaml
