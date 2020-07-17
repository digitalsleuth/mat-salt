include:
  - mat.packages.software-properties-common

openjdk-repo:
  pkgrepo.managed:
    - humanname: openjdk
    - ppa: openjdk-r/ppa
    - refresh: true
    - require:
      - sls: mat.packages.software-properties-common
