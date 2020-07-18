include:
  - mat.theme.desktop.ubuntu-budgie-desktop
  - mat.theme.desktop.lightdm
  - mat.theme.desktop.autologin

mat-theme-desktop:
  test.nop:
    - require:
      - sls: mat.theme.desktop.ubuntu-budgie-desktop
      - sls: mat.theme.desktop.lightdm
      - sls: mat.theme.desktop.autologin
