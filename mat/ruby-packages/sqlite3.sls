include:
  - mat.apt-packages.ruby-full
  - mat.apt-packages.libsqlite3-dev

mat-ruby-packages-sqlite3:
  gem.installed:
    - name: sqlite3
    - require:
      - sls: mat.apt-packages.ruby-full
      - sls: mat.apt-packages.libsqlite3-dev
