#!/bin/bash

docker run -it --rm --name="mat-test-all" -v `pwd`/mat:/srv/salt/mat --cap-add SYS_ADMIN digitalsleuth/mat-salt-tester:bionic:focal \
  salt-call -l info --local --retcode-passthrough --state-output=mixed state.sls mat pillar='{"mat_user": "root"}'
