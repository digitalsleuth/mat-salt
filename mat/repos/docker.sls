include:
  - mat.apt-packages.software-properties-common

mat-repos-docker-key:
  file.managed:
    - name: /usr/share/keyrings/DOCKER-PGP-KEY.asc
    - source: https://download.docker.com/linux/ubuntu/gpg
    - skip_verify: True
    - makedirs: True

mat-repos-docker:
  pkgrepo.managed:
    - humanname: Docker
    - name: deb [arch=amd64 signed-by=/usr/share/keyrings/DOCKER-PGP-KEY.asc] https://download.docker.com/linux/ubuntu {{ grains['lsb_distrib_codename'] }} stable
    - dist: {{ grains['lsb_distrib_codename'] }}
    - file: /etc/apt/sources.list.d/docker.list
    - refresh: true
    - clean_file: True
    - require:
      - sls: mat.apt-packages.software-properties-common
      - file: mat-repos-docker-key
