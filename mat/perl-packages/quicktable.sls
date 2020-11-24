include:
  - mat.apt-packages.perl
  - mat.apt-packages.build-essential

mat-perl-packages-quicktable:
  cmd.run:
    - name: cpanm --no-man-pages install HTML::QuickTable
    - env:
      - PERL_MM_USE_DEFAULT: 1
    - require:
      - sls: mat.apt-packages.perl
      - sls: mat.apt-packages.build-essential
