#!/bin/bash

# renovate: datasource=github-releases artifactNamespace=getsops artifactName=sops versioning=loose
SOPS_VERSION=3.8.1

# install SOPS
wget -q -O /usr/local/bin/sops https://github.com/getsops/sops/releases/download/v"${SOPS_VERSION}"/sops-v"${SOPS_VERSION}".linux.amd64
chmod +x /usr/local/bin/sops

# renovate: datasource=github-releases artifactNamespace=apache artifactName=maven versioning=semver
MAVEN_VERSION=3.9.8

# renovate: datasource=github-releases artifactNamespace=apache artifactName=maven versioning=semver
MAVEN_VERSION=3.9.8
MAVEN_DOWNLOAD_DIR=/tmp/maven
mkdir -p $MAVEN_DOWNLOAD_DIR
wget https://github.com/apache/maven/apache-maven/$MAVEN_VERSION/apache-maven-$MAVEN_VERSION-bin.tar.gz -P $MAVEN_DOWNLOAD_DIR/
tar xf $MAVEN_DOWNLOAD_DIR/apache-maven-$MAVEN_VERSION-bin.tar.gz -C /opt
ln -s /opt/apache-maven-$MAVEN_VERSION /opt/maven
touch /etc/profile.d/maven.sh
cat > /etc/profile.d/maven.sh <<'EOF'
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export M3_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${M3_HOME}/bin:${PATH}
EOF
