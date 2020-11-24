include:
  - mat.apt-packages.perl

libdbi-perl:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.perl
