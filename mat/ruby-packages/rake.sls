include:
  - mat.apt-packages.ruby-full

rake:
  gem.installed:
    - require:
      - sls: mat.apt-packages.ruby-full
