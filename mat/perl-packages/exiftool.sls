include:
  - mat.apt-packages.perl

libimage-exiftool-perl:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.perl
