include:
  - mat.repos.gift

mat-apt-packages-libafflib-dev:
  pkg.installed:
    - name: libafflib-dev
    - require:
      - sls: mat.repos.gift
