include:
  - mat.apt-packages.default-jdk
  - mat.apt-packages.libswt-gtk-4-java

mat-tools-eclipse-source:
  file.managed:
    - name: /usr/local/src/mat/files/eclipse-java-2020-09-R-linux-gtk-x86_64.tar.gz
    - source: http://mirror.umd.edu/eclipse/technology/epp/downloads/release/2020-09/R/eclipse-java-2020-09-R-linux-gtk-x86_64.tar.gz
    - source_hash: sha256=ad597ad092d349f7a2bca3ca2145614a3e9fdf3d5311b24bff1089010fd34f5e
    - makedirs: True
    - replace: False

mat-tools-eclipse-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/eclipse-java-2020-09-R-linux-gtk-x86_64.tar.gz
    - enforce_toplevel: True
    - force: true
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
