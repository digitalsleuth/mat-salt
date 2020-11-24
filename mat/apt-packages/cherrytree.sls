include:
  - mat.apt-packages.libcanberra-gtk-module

cherrytree:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.libcanberra-gtk-module
