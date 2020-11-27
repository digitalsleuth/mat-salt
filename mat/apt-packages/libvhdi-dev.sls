include:
  - mat.repos.gift

mat-apt-packages-libvhdi-dev:
  pkg.installed:
    - name: libvhdi-dev
    - require:
      - sls: mat.repos.gift
