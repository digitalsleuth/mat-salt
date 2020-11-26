include:
  - mat.apt-packages.ruby-full

keyed_archive:
  gem.installed:
    - require:
      - sls: mat.apt-packages.ruby-full
