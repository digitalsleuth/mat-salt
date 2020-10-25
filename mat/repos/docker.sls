include:
  - mat.apt-packages.software-properties-common

mat-repos-docker:
  pkgrepo.managed:
    - humanname: Docker
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ grains['lsb_distrib_codename'] }} stable
    - dist: {{ grains['lsb_distrib_codename'] }}
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/ubuntu/gpg
    - refresh: true
    - require:
      - sls: mat.apt-packages.software-properties-common
