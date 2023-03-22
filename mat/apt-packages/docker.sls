# Name: Docker
# Website: https://www.docker.com
# Description: Container creation and management tool
# Category: System Requirements
# Author: Docker Inc
# License: Apache License 2.0 (https://github.com/moby/moby/blob/master/LICENSE)
# Version: 20.10.22
# Notes: docker

include:
  - mat.repos.docker

docker-engine:
  pkg.removed

docker-ce:
  pkg.installed:
    - require:
      - pkg: docker-engine
      - sls: mat.repos.docker
