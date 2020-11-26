include:
  - mat.ruby-packages.aes-key-wrap
  - mat.ruby-packages.fileutils
  - mat.ruby-packages.google-protobuf
  - mat.ruby-packages.keyed-archive
  - mat.ruby-packages.openssl
  - mat.ruby-packages.rake
  - mat.ruby-packages.sqlite3
  - mat.ruby-packages.zlib

mat-ruby-packages:
  test.nop:
    - require:
      - sls: mat.ruby-packages.aes-key-wrap
      - sls: mat.ruby-packages.fileutils
      - sls: mat.ruby-packages.google-protobuf
      - sls: mat.ruby-packages.keyed-archive
      - sls: mat.ruby-packages.openssl
      - sls: mat.ruby-packages.rake
      - sls: mat.ruby-packages.sqlite3
      - sls: mat.ruby-packages.zlib
