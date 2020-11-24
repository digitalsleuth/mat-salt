include:
  - mat.apt-packages.perl

libxml-xpath-perl:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.perl
