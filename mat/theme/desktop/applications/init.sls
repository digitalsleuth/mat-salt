{%- set user = salt['pillar.get']('mat_user', 'mat') -%}

{%- if user == "root" -%}
  {%- set home = "/root" -%}
{%- else %}
  {%- set home = "/home/" + user -%}
{%- endif -%}

include:
  - mat.config.user
  - mat.tools.cyberchef

mat-theme-desktop-applications-config:
  file.managed:
      - name: /usr/local/share/mat/mat-gnome-settings.sh
      - source: salt://mat/theme/desktop/applications/mat-gnome-settings.sh
      - mode: 755
      - makedirs: True

mat-theme-desktop-applications-config-autostart:
  file.managed:
    - replace: False
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}/.config/autostart/mat-gnome-settings.desktop
    - source: salt://mat/theme/desktop/applications/mat-gnome-settings.desktop
    - makedirs: True
    - require:
      - user: mat-user-{{ user }}
      - file: mat-theme-desktop-applications-config

mat-theme-desktop-applications-cyberchef:
  file.managed:
    - replace: False
    - name: /usr/share/applications/cyberchef.desktop
    - source: salt://mat/theme/desktop/applications/cyberchef.desktop
    - makedirs: True
    - watch:
      - file: mat-theme-desktop-applications-config-autostart
    - require:
      - sls: mat.tools.cyberchef

mat-theme-desktop-applications-cyberchef-icon:
  file.managed:
    - replace: False
    - name: /usr/share/icons/cyberchef.png
    - source: salt://mat/theme/desktop/applications/cyberchef.png
    - makedirs: True
    - watch:
      - file: mat-theme-desktop-applications-cyberchef
    - require:
      - sls: mat.tools.cyberchef

mat-theme-desktop-applications-autostart-tilix:
  file.copy:
    - name: {{ home }}/.config/autostart/com.gexperts.Tilix.desktop
    - source: /usr/share/applications/com.gexperts.Tilix.desktop
    - require:
      - user: mat-user-{{ user }}
