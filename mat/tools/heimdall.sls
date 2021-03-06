# Name: Heimdall
# Website: https://glassechidna.com.au/
# Description: Open source software for flashing firmware to Samsung mobile devices
# Category:
# Author: Benjamin Dobell
# License: MIT License (https://github.com/Benjamin-Dobell/Heimdall/blob/master/LICENSE)
# Notes: heimdall, heimdall-frontend

include:
  - mat.apt-packages.build-essential
  - mat.apt-packages.cmake
  - mat.apt-packages.zlib1g-dev
  - mat.apt-packages.qt5-default
  - mat.apt-packages.libusb-1
  - mat.apt-packages.libgl1-mesa-dev
  - mat.apt-packages.git

mat-tools-heimdall-pre-clean:
  file.absent:
    - name: /usr/local/src/mat/files/heimdall

mat-tools-heimdall-source:
  git.cloned:
    - name: https://github.com/Benjamin-Dobell/Heimdall.git
    - target: /usr/local/src/mat/files/heimdall
    - require:
      - sls: mat.apt-packages.git

mat-tools-heimdall-make:
  cmd.run:
    - cwd: /usr/local/src/mat/files/heimdall
    - name: |
        mkdir build
        cd build
        cmake -DCMAKE_BUILD_TYPE=Release ..
        make
        make install
    - require:
      - sls: mat.apt-packages.build-essential
      - sls: mat.apt-packages.cmake
      - sls: mat.apt-packages.zlib1g-dev
      - sls: mat.apt-packages.qt5-default
      - sls: mat.apt-packages.libusb-1
      - sls: mat.apt-packages.libgl1-mesa-dev

mat-tools-heimdall-cleanup:
  file.absent:
    - name: /usr/local/src/mat/files/heimdall
    - watch:
      - cmd: mat-tools-heimdall-make
