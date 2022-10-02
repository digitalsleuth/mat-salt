include:
  - mat.theme.desktop.autologin
  - mat.theme.desktop.open-vm-tools
  - mat.theme.desktop.open-vm-tools-desktop
  - mat.theme.desktop.applications
  - mat.theme.desktop.tab-title
  - mat.theme.desktop.mat-logo

mat-theme-desktop:
  test.nop:
    - require:
      - sls: mat.theme.desktop.autologin
      - sls: mat.theme.desktop.open-vm-tools
      - sls: mat.theme.desktop.open-vm-tools-desktop
      - sls: mat.theme.desktop.applications
      - sls: mat.theme.desktop.tab-title
      - sls: mat.theme.desktop.mat-logo
