# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.default-jdk
  - mat.apt-packages.libswt-gtk-4-java

mat-tools-eclipse-source:
  file.managed:
    - name: /usr/local/src/mat/files/eclipse-java-2020-12-R-linux-gtk-x86_64.tar.gz
    - source: https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2020-12/R/eclipse-java-2020-12-R-linux-gtk-x86_64.tar.gz&r=1
    - source_hash: sha256=2193208753cae8505b4926386dc7bb71cb665929180bf8c1a63dda0251dbaaf1
    - makedirs: True
    - replace: False

mat-tools-eclipse-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/eclipse-java-2020-12-R-linux-gtk-x86_64.tar.gz
    - enforce_toplevel: True
    - trim_output: True
    - force: True
    - watch:
      - file: mat-tools-eclipse-source

mat-tools-eclipse-symlink:
  file.symlink:
    - name: /usr/local/bin/eclipse
    - target: /usr/local/eclipse/eclipse
    - mode: 755
    - watch:
      - archive: mat-tools-eclipse-archive
    - require:
      - sls: mat.apt-packages.default-jdk
      - sls: mat.apt-packages.libswt-gtk-4-java
