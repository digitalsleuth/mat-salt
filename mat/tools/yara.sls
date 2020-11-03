# Name: 
# Website:
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
    - name: /usr/local/src/mat/files/v4.0.2.zip
    - source: https://github.com/VirusTotal/yara/archive/v4.0.2.zip
    - source_hash: sha256=d4a45e36b9a4bf39f2f5c4cefdb0345d161cd69a5ced7000a825b5e100f242cd
    - makedirs: True

mat-tools-yara-archive:
  archive.extracted:
    - name: /usr/local/src/
    - source: /usr/local/src/mat/files/v4.0.2.zip
    - enforce_toplevel: true
    - watch:
      - file: mat-tools-yara-source

mat-tools-yara-androguard-module:
  file.managed:
    - name: /usr/local/src/yara-4.0.2/libyara/modules/androguard.c
    - source: https://github.com/Koodous/androguard-yara/raw/master/androguard.c
    - source_hash: sha256=0e89e4cb74bfbb8b532328d90ddcb46cee452c415a90df3137e8136f176d2502
    - makedirs: false
    - watch:
      - archive: mat-tools-yara-archive

/usr/local/src/yara-4.0.2/libyara/Makefile.am:
  file.managed:
    - source: salt://mat/files/yara/Makefile.am
    - mode: 755
    - replace: True
    - watch: 
      - file: mat-tools-yara-androguard-module

/usr/local/src/yara-4.0.2/libyara/modules/module_list:
  file.managed:
    - source: salt://mat/files/yara/module_list
    - mode: 755
    - replace: True
    - watch:
      - file: mat-tools-yara-androguard-module

mat-tools-yara-build:
  cmd.run:
    - cwd: /usr/local/src/yara-4.0.2
    - name: |
        ./bootstrap.sh
        ./configure --enable-cuckoo --enable-dex --enable-magic
        make
        make install
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
    - name: /usr/local/src/yara-4.0.2
    - watch:
      - cmd: mat-tools-yara-build
