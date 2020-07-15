#!/bin/bash

set -x

DISTRO=${DISTRO:="bionic"}
STATE=$1

docker run -it --rm --name="mat-state-${STATE}" -v `pwd`/mat:/srv/salt/mat --cap-add SYS_ADMIN digitalsleuth/mat-salt-tester:${DISTRO} \
  /bin/bash
