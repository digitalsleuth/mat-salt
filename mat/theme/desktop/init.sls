include:
  - mat.theme.desktop.ubuntu-budgie-desktop
  - mat.theme.desktop.autologin
  - mat.theme.desktop.open-vm-tools
  - mat.theme.desktop.open-vm-tools-desktop
  - mat.theme.desktop.plank-config
  - mat.theme.desktop.applications
  - mat.theme.desktop.xwayland
  - mat.theme.desktop.gdm3
  - mat.theme.desktop.mat-logo

mat-theme-desktop:
  test.nop:
    - require:
      - sls: mat.theme.desktop.ubuntu-budgie-desktop
      - sls: mat.theme.desktop.autologin
      - sls: mat.theme.desktop.open-vm-tools
      - sls: mat.theme.desktop.open-vm-tools-desktop
      - sls: mat.theme.desktop.plank-config
      - sls: mat.theme.desktop.applications
      - sls: mat.theme.desktop.xwayland
      - sls: mat.theme.desktop.gdm3
      - sls: mat.theme.desktop.mat-logo
