include:
  - mat.apt-packages.python2-pip
  - mat.apt-packages.python3-pip

requests:
  pip.installed:
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: mat.apt-packages.python2-pip
