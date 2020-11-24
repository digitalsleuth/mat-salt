include:
  - mat.apt-packages.perl

libcgi-pm-perl:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.perl
