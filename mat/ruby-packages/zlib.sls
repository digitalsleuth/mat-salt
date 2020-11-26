include:
  - mat.apt-packages.ruby-full

zlib:
  gem.installed:
    - require:
      - sls: mat.apt-packages.ruby-full
