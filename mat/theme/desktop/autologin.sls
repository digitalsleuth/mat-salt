{% set user = salt['pillar.get']('mat_user', 'mat') %}

include:
  - mat.theme.desktop.ubuntu-budgie-desktop
  - mat.theme.desktop.lightdm

mat-desktop-autologin-user:
  file.append:
    - name: /etc/lightdm/lightdm.conf
    - text: autologin-user={{ user }}
    - require:
      - sls: mat.theme.desktop.ubuntu-budgie-desktop
      - sls: mat.theme.desktop.lightdm
