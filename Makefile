#
# Makefile for docker Vagrant image
#

RECIPE := build.json
BOX    := jhunt/docker

default: test

test:
	@cat $(RECIPE) | jq . >/dev/null
	@packer validate $(RECIPE)

push:
	packer push -name $(BOX) $(RECIPE)

build:
	packer build $(RECIPE)

clean:
	rm -rf output-*/

import:
	vagrant box remove --force docker || true
	vagrant box add --name docker boxen/docker.box
