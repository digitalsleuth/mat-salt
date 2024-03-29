{%- set user = salt['pillar.get']('mat_user', 'mat') -%}
{%- if user == "root" -%}
  {%- set home = "/root" -%}
{%- else -%}
  {%- set home = salt['user.info'](user).home -%}
{%- endif -%}

include:
  - mat.apt-packages.git
  - mat.apt-packages.dbus-x11

mat-theme-terminal-font:
  git.latest:
    - name: https://github.com/adobe-fonts/source-code-pro.git
    - target: /usr/share/fonts/adobe-source-code-pro
    - rev: release
    - branch: release
    - depth: 1

mat-theme-terminal-font-install:
  cmd.run:
    - name: fc-cache -f -v /usr/share/fonts/adobe-source-code-pro
    - require:
      - git: mat-theme-terminal-font

mat-theme-terminal-profile:
  file.managed:
    - name: /usr/local/share/mat/terminal.profile
    - source: salt://mat/theme/terminal.profile
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True

mat-theme-terminal-profile-install:
  cmd.run:
    - name: dconf load /org/gnome/terminal/legacy/profiles:/ < /usr/local/share/mat/terminal.profile
    - runas: {{ user }}
    - cwd: {{ home }}
    - shell: /bin/bash
    - onlyif:
      - fun: cmd.run
        cmd: export DBUS_SESSION_BUS_ADDRESS=$(dbus-launch | grep DBUS_SESSION_BUS_ADDRESS | cut -d= -f2-)
        shell: /bin/bash
        python_shell: True
        runas: {{ user }}
    - require:
      - file: mat-theme-terminal-profile
      - sls: mat.apt-packages.dbus-x11
    - watch:
      - file: mat-theme-terminal-profile
      - sls: mat.apt-packages.dbus-x11
