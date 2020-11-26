include:
  - mat.apt-packages.ruby-full
  - mat.apt-packages.libsqlite3-dev

sqlite3:
  gem.installed:
    - require:
      - sls: mat.apt-packages.ruby-full
      - sls: mat.apt-packages.libsqlite3-dev
