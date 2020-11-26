include:
  - mat.apt-packages.ruby-full

google-protobuf:
  gem.installed:
    - require:
      - sls: mat.apt-packages.ruby-full

