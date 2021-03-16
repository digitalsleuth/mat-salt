# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

include:
  - mat.apt-packages.libatomic1
  - mat.apt-packages.libgtk2
  - mat.apt-packages.libsm6
  - mat.apt-packages.libcanberra-gtk-module
  - mat.apt-packages.libncurses5

mat-tools-impactor-source:
  archive.extracted:
    - name: /usr/local/impactor
    - source: https://cydia.saurik.com/api/latest/5
    - source_hash: sha256=73b8aeb26b13c0993eedd74f6c6f833c9fb0ef0119c33a69a4efbc3298dc8b5b
    - archive_format: tar
    - makedirs: True
    - overwrite: True
    - enforce_toplevel: False
    - require:
      - sls: mat.apt-packages.libcanberra-gtk-module
      - sls: mat.apt-packages.libatomic1
      - sls: mat.apt-packages.libgtk2
      - sls: mat.apt-packages.libsm6
      - sls: mat.apt-packages.libncurses5

/usr/local/bin/impactor:
  file.symlink:
    - target: /usr/local/impactor/Impactor
    - mode: 755
    - watch:
      - archive: mat-tools-impactor-source
