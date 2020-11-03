#!/bin/bash
echo "salt-call -l debug --local --retcode-passthrough --state-output=mixed state.sls mat.  pillar='{"mat_user": "mat"}'"
set -x

DISTRO=$1
STATE=$2
docker run -it --rm --name="mat-state-${STATE}" -v `pwd`/mat:/srv/salt/mat --cap-add SYS_ADMIN digitalsleuth/mat-salt-tester:${DISTRO} \
  /bin/bash
