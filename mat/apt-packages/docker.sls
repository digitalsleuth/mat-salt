# Name: Docker
# Website: https://www.docker.com
# Description: 
# Category: 
# Author: Docker Inc
# License: Apache License 2.0: https://github.com/moby/moby/blob/master/LICENSE
# Notes: 

include:
  - mat.repos.docker

docker-engine:
  pkg.removed

docker-ce:
  pkg.installed:
    - require:
      - pkg: docker-engine
      - sls: mat.repos.docker
