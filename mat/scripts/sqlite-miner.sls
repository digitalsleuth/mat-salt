include:
  - mat.apt-packages.perl
  - mat.perl-packages.archive-tar
  - mat.perl-packages.data-dumper
  - mat.perl-packages.dbi
  - mat.perl-packages.file-copy
  - mat.perl-packages.file-find
  - mat.perl-packages.file-path
  - mat.perl-packages.file-spec-functions
  - mat.perl-packages.getopt
  - mat.perl-packages.io-uncompress
  - mat.perl-packages.posix
  - mat.perl-packages.time-hires

mat-scripts-sqlite-miner-source-1:
  file.managed:
    - name: /usr/local/bin/sqlite_miner.pl
    - source: https://github.com/threeplanetssoftware/sqlite_miner/raw/master/sqlite_miner.pl
    - source_hash: 0d4b380a27dd57380b581224b1258fbd5059b9314d59aa7ee2f260d352f82278
    - mode: 755

mat-scripts-sqlite-miner-source-2:
  file.managed:
    - name: /usr/local/bin/fun_stuff.pl
    - source: https://github.com/threeplanetssoftware/sqlite_miner/raw/master/fun_stuff.pl
    - source_hash: c2e887dc62cb8191e0333f95d2e0eee330f62a778abf394f2ae158be39e44590
    - mode: 755

mat-scripts-sqlite-miner-shebang:
  file.prepend:
    - name: /usr/local/bin/sqlite_miner.pl
    - text: '#!/usr/bin/env perl'
    - watch:
      - file: mat-scripts-sqlite-miner-source-1
    - require:
      - sls: mat.apt-packages.perl
      - sls: mat.perl-packages.archive-tar
      - sls: mat.perl-packages.data-dumper
      - sls: mat.perl-packages.dbi
      - sls: mat.perl-packages.file-copy
      - sls: mat.perl-packages.file-find
      - sls: mat.perl-packages.file-path
      - sls: mat.perl-packages.file-spec-functions
      - sls: mat.perl-packages.getopt
      - sls: mat.perl-packages.io-uncompress
      - sls: mat.perl-packages.posix
      - sls: mat.perl-packages.time-hires
