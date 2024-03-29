# Name: apkid
# Website: https://github.com/rednaga/APKiD
# Description: PEID for Android
# Category: Android
# Author: https://github.com/rednaga/APKiD/blob/master/AUTHORS.txt
# License: GNU GPL v3 (https://github.com/rednaga/APKiD/blob/master/LICENSE.GPL)
# Notes: apkid

include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.git
  - mat.apt-packages.python3-virtualenv
  - mat.apt-packages.python3-venv
  - mat.apt-packages.virtualenv
  - mat.python3-packages.wheel

mat-python3-packages-apkid-virtualenv:
  virtualenv.managed:
    - name: /opt/apkid
    - venv_bin: /usr/bin/virtualenv
    - python: /usr/bin/python3
    - pip_pkgs:
      - pip>=21.4.2
      - setuptools
      - wheel>=0.36
    - require:
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.python3-virtualenv
      - sls: mat.apt-packages.python3-venv
      - sls: mat.apt-packages.virtualenv

mat-python3-packages-apkid-custom-yara-build:
  cmd.run:
    - name: /opt/apkid/bin/python3 -m pip wheel --wheel-dir=/tmp/yara-python --build-option="build" --build-option="--enable-dex" git+https://github.com/VirusTotal/yara-python.git@v3.11.0
    - require:
      - virtualenv: mat-python3-packages-apkid-virtualenv
      - sls: mat.apt-packages.git

mat-python3-packages-apkid-custom-yara-install:
  cmd.run:
    - name: /opt/apkid/bin/python3 -m pip install --no-index --find-links=/tmp/yara-python yara-python
    - require:
      - virtualenv: mat-python3-packages-apkid-virtualenv
      - cmd: mat-python3-packages-apkid-custom-yara-build

mat-python3-packages-apkid:
  pip.installed:
    - name: apkid
    - bin_env: /opt/apkid/bin/python3
    - upgrade: True
    - require:
      - virtualenv: mat-python3-packages-apkid-virtualenv
      - cmd: mat-python3-packages-apkid-custom-yara-install

mat-python3-packages-apkid-symlink:
  file.symlink:
    - name: /usr/local/bin/apkid
    - target: /opt/apkid/bin/apkid
    - force: true
    - require:
      - pip: mat-python3-packages-apkid
