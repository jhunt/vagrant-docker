#!/bin/bash

set -ex
echo "Installing Docker"
apt-key adv \
	--keyserver hkp://p80.pool.sks-keyservers.net:80 \
	--recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
	>/dev/null

cat >/etc/apt/sources.list.d/docker.list <<EOF
deb https://apt.dockerproject.org/repo ubuntu-vivid main
EOF

apt-get update >/dev/null
apt-get install -y \
	linux-image-extra-$(uname -r) \
	docker-engine \
	vim emacs24-nox \

docker pull filefrog/sandbox
usermod -aG docker vagrant
