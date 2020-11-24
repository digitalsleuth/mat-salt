include:
  - mat.perl-packages.cgi
  - mat.perl-packages.datecalc
  - mat.perl-packages.dbi
  - mat.perl-packages.exiftool
  - mat.perl-packages.json
  - mat.perl-packages.quicktable
  - mat.perl-packages.xpath

mat-perl-packages:
  test.nop:
    - name: mat-perl-packages
    - require:
      - sls: mat.perl-packages.cgi
      - sls: mat.perl-packages.datecalc
      - sls: mat.perl-packages.dbi
      - sls: mat.perl-packages.exiftool
      - sls: mat.perl-packages.json
      - sls: mat.perl-packages.quicktable
      - sls: mat.perl-packages.xpath
