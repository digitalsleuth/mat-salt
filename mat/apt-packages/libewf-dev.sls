include:
  - mat.repos.gift

mat-apt-packages-libewf-dev:
  pkg.installed:
    - name: libewf-dev
    - require:
      - sls: mat.repos.gift
