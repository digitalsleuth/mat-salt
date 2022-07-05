{% set user = salt['pillar.get']('mat_user', 'mat') %}

include:
  - mat.theme.desktop.ubuntu-budgie-desktop

mat-desktop-autologin-user:
  file.append:
    - name: /etc/lightdm/lightdm.conf
    - text:
      - '[Seat:*]'
      - autologin-user={{ user }}
    - require:
      - sls: mat.theme.desktop.ubuntu-budgie-desktop

mat-desktop-disable-lockout:
  cmd.run:
    - name: 'gsettings set org.gnome.desktop.screensaver lock-enabled false'
    - require:
      - file: mat-desktop-autologin-user

mat-desktop-unlock-sessions:
  cmd.run:
    - name: 'loginctl unlock-sessions'
    - require:
      - cmd: mat-desktop-disable-lockout

