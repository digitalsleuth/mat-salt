include:
  - mat.apt-packages.ruby-full

aes_key_wrap:
  gem.installed:
    - require:
      - sls: mat.apt-packages.ruby-full
