include:
  - mat.ruby-packages.aes-key-wrap
  - mat.ruby-packages.fileutils
  - mat.ruby-packages.google-protobuf
  - mat.ruby-packages.keyed-archive
  - mat.ruby-packages.openssl
  - mat.ruby-packages.rake
  - mat.ruby-packages.sqlite3
  - mat.ruby-packages.zlib
  - mat.apt-packages.ruby-full
  - mat.apt-packages.git

mat-tools-apple-cloud-notes-parser-source:
  git.cloned:
    - name: https://github.com/threeplanetssoftware/apple_cloud_notes_parser
    - target: /usr/local/src/apple_cloud_notes_parser
    - require:
      - sls: mat.apt-packages.git

mat-tools-apple-cloud-notes-parser-wrapper:
  file.managed:
    - name: /usr/local/bin/notes_cloud_ripper
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - ruby /usr/local/src/apple_cloud_notes_parser/notes_cloud_ripper.rb ${*}
    - watch:
      - git: mat-tools-apple-cloud-notes-parser-source
    - require:
      - sls: mat.ruby-packages.aes-key-wrap
      - sls: mat.ruby-packages.fileutils
      - sls: mat.ruby-packages.google-protobuf
      - sls: mat.ruby-packages.keyed-archive
      - sls: mat.ruby-packages.openssl
      - sls: mat.ruby-packages.rake
      - sls: mat.ruby-packages.sqlite3
      - sls: mat.ruby-packages.zlib
      - sls: mat.apt-packages.ruby-full
