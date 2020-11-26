include:
  - mat.apt-packages.python3-pip

dnslib:
  pip.installed:
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python3-pip
