{% set user = salt['pillar.get']('mat_user', 'mat') %}

mat-desktop-disable-lockout:
  cmd.run:
    - names:
      - 'gsettings set org.gnome.desktop.screensaver lock-enabled false'
      - 'gsettings set org.gnome.settings-daemon.plugins.power idle-dim false'

mat-desktop-unlock-sessions:
  cmd.run:
    - name: 'loginctl unlock-sessions'
    - require:
      - cmd: mat-desktop-disable-lockout

mat-desktop-autologin-gdm3:
  file.replace:
    - name: /etc/gdm3/custom.conf
    - pattern: '#  AutomaticLoginEnable = true'
    - repl: 'AutomaticLoginEnable = true'
    - count: 1
    - prepend_if_not_found: True
    - require:
      - cmd: mat-desktop-unlock-sessions

mat-desktop-autologin-gdm3-user:
  file.replace:
    - name: /etc/gdm3/custom.conf
    - pattern: '#  AutomaticLogin = user1'
    - repl: 'AutomaticLogin = {{ user }}'
    - count: 1
    - prepend_if_not_found: True
    - watch:
      - file: mat-desktop-autologin-gdm3

mat-desktop-autologin-wayland:
  file.uncomment:
    - name: /etc/gdm3/custom.conf
    - regex: ^WaylandEnable=false$
    - require:
      - file: mat-desktop-autologin-gdm3-user
