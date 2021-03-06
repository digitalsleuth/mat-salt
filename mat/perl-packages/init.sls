include:
  - mat.perl-packages.archive-tar
  - mat.perl-packages.cgi
  - mat.perl-packages.data-dumper
  - mat.perl-packages.datecalc
  - mat.perl-packages.dbi
  - mat.perl-packages.exiftool
  - mat.perl-packages.file-copy
  - mat.perl-packages.file-find
  - mat.perl-packages.file-path
  - mat.perl-packages.file-spec-functions
  - mat.perl-packages.getopt
  - mat.perl-packages.io-uncompress
  - mat.perl-packages.json
  - mat.perl-packages.posix
  - mat.perl-packages.quicktable
  - mat.perl-packages.time-hires
  - mat.perl-packages.xpath

mat-perl-packages:
  test.nop:
    - name: mat-perl-packages
    - require:
      - sls: mat.perl-packages.archive-tar
      - sls: mat.perl-packages.cgi
      - sls: mat.perl-packages.data-dumper
      - sls: mat.perl-packages.datecalc
      - sls: mat.perl-packages.dbi
      - sls: mat.perl-packages.exiftool
      - sls: mat.perl-packages.file-copy
      - sls: mat.perl-packages.file-find
      - sls: mat.perl-packages.file-path
      - sls: mat.perl-packages.file-spec-functions
      - sls: mat.perl-packages.getopt
      - sls: mat.perl-packages.io-uncompress
      - sls: mat.perl-packages.json
      - sls: mat.perl-packages.posix
      - sls: mat.perl-packages.quicktable
      - sls: mat.perl-packages.time-hires
      - sls: mat.perl-packages.xpath

