include:
  - mat.theme.desktop.ubuntu-budgie-desktop
  - mat.theme.desktop.autologin
  - mat.theme.desktop.disable-sounds
  - mat.theme.desktop.open-vm-tools
  - mat.theme.desktop.open-vm-tools-desktop
  - mat.theme.desktop.plank-config

mat-theme-desktop:
  test.nop:
    - require:
      - sls: mat.theme.desktop.ubuntu-budgie-desktop
      - sls: mat.theme.desktop.autologin
      - sls: mat.theme.desktop.disable-sounds
      - sls: mat.theme.desktop.open-vm-tools
      - sls: mat.theme.desktop.open-vm-tools-desktop
      - sls: mat.theme.desktop.plank-config
