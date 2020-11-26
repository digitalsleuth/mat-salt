include:
  - mat.apt-packages.ruby-full

openssl:
  gem.installed:
    - require:
      - sls: mat.apt-packages.ruby-full
