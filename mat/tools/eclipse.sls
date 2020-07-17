include:
  - mat.packages.default-jdk
  - mat.packages.libswt-gtk-4-java

mat-tools-eclipse-source:
  file.managed:
    - name: /usr/local/src/mat/files/eclipse-java-2020-06-R-linux-gtk-x86_64.tar.gz
    - source: http://mirror.umd.edu/eclipse/technology/epp/downloads/release/2020-06/R/eclipse-java-2020-06-R-linux-gtk-x86_64.tar.gz
    - source_hash: sha256=dc52b7486715cf13aa2642b7e96fc7d2ea1d0544c070110dd52b2644ec869e76
    - makedirs: True
    - replace: False

mat-tools-eclipse-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/eclipse-java-2020-06-R-linux-gtk-x86_64.tar.gz
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
      - sls: mat.packages.default-jdk
      - sls: mat.packages.libswt-gtk-4-java
