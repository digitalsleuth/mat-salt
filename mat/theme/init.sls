include:
  - mat.theme.desktop
  - mat.theme.cleanup
  - mat.theme.hostname
  - mat.theme.disable-ssh

mat-theme:
  test.nop:
    - require:
      - sls: mat.theme.desktop
      - sls: mat.theme.cleanup
      - sls: mat.theme.hostname
      - sls: mat.theme.disable-ssh
