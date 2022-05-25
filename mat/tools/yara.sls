{% set prev_version="v4.0.2.zip" %}
{% set curr_version="v4.2.1.zip" %}

# Name: yara
# Website: https://github.com/VirusTotal/yara
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.libjansson-dev
  - mat.apt-packages.libmagic-dev
  - mat.apt-packages.libprotobuf-c-dev
  - mat.apt-packages.automake
  - mat.apt-packages.libtool
  - mat.apt-packages.pkg-config
  - mat.apt-packages.build-essential
  - mat.apt-packages.flex
  - mat.apt-packages.bison
  - mat.apt-packages.libssl-dev

mat-tools-yara-source:
  file.managed:
    - name: /usr/local/src/mat/files/{{ curr_version }}
    - source: https://github.com/VirusTotal/yara/archive/{{ curr_version }}
    - source_hash: sha256=1cf16f884041760c3fd8c834e3b29ef183cf148095debc41d049d7fff6c83466
    - makedirs: True

mat-tools-yara-archive:
  archive.extracted:
    - name: /usr/local/src/
    - source: /usr/local/src/mat/files/{{ curr_version }}
    - enforce_toplevel: true
    - watch:
      - file: mat-tools-yara-source

mat-tools-yara-build:
  cmd.run:
    - cwd: /usr/local/src/yara-4.2.1
    - name: |
        ./bootstrap.sh
        ./configure --enable-cuckoo --enable-dex --enable-magic
        make
        make install
        ldconfig
    - require:
      - sls: mat.apt-packages.libjansson-dev
      - sls: mat.apt-packages.libmagic-dev
      - sls: mat.apt-packages.libprotobuf-c-dev
      - sls: mat.apt-packages.automake
      - sls: mat.apt-packages.libtool
      - sls: mat.apt-packages.pkg-config
      - sls: mat.apt-packages.build-essential
      - sls: mat.apt-packages.flex
      - sls: mat.apt-packages.bison
      - sls: mat.apt-packages.libssl-dev

mat-tools-yara-cleanup:
  file.absent:
    - name: /usr/local/src/yara-4.2.1
    - watch:
      - cmd: mat-tools-yara-build

mat-tools-yara-upgrade-cleanup:
  file.absent:
    - name: /usr/local/src/mat/files/{{ prev_version }}
    - watch:
      - file: mat-tools-yara-cleanup
