include:
  - mat.apt-packages.default-jre

mat-tools-apktool-source:
  file.managed:
    - name: /usr/local/apktool/apktool_2.4.1.jar
    - source: https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.4.1.jar
    - source_hash: sha256=bdeb66211d1dc1c71f138003ce35f6d0cd19af6f8de7ffbdd5b118d02d825a52
    - mode: 755
    - makedirs: True

mat-tools-apktool-wrapper:
  file.managed:
    - name: /usr/local/bin/apktool
    - mode: 755
    - watch:
      - file: mat-tools-apktool-source
    - require:
      - sls: mat.apt-packages.default-jre
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/apktool/apktool_2.4.1.jar ${*}

