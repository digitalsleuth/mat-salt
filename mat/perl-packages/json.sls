include:
  - mat.apt-packages.perl

libjson-perl:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.perl
