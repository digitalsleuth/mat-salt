{%- set user = salt['pillar.get']('mat_user', 'mat') -%}

{%- if user == "root" -%}
  {%- set home = "/root" -%}
{%- else %}
  {%- set home = "/home/" + user -%}
{%- endif -%}

include:
  - mat.config.user
  - mat.tools.cyberchef
  - mat.tools.jadx
  - mat.apt-packages.gnome-sushi
  - mat.apt-packages.gnome-system-tools
  - mat.apt-packages.gnome-shell-extensions
  - mat.apt-packages.gnome-shell-extension-prefs
  - mat.apt-packages.gnome-tweaks

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

mat-theme-desktop-applications-autostart-terminal:
  file.copy:
    - name: {{ home }}/.config/autostart/org.gnome.Terminal.desktop
    - source: /usr/share/applications/org.gnome.Terminal.desktop
    - require:
      - user: mat-user-{{ user }}

mat-theme-desktop-applications-merged-dir:
  file.directory:
    - name: /etc/xdg/menus/applications-merged
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - watch:
      - file: mat-theme-desktop-applications-autostart-terminal
    - require:
      - sls: mat.apt-packages.gnome-sushi
      - sls: mat.apt-packages.gnome-system-tools
      - sls: mat.apt-packages.gnome-shell-extensions
      - sls: mat.apt-packages.gnome-shell-extension-prefs
      - sls: mat.apt-packages.gnome-tweaks

mat-theme-desktop-applications-menus:
  file.recurse:
    - name: /etc/xdg/menus/applications-merged/
    - source: salt://mat/theme/desktop/applications/
    - include_pat: '*.menu'
    - user: root
    - group: root
    - file_mode: 644
    - require:
      - file: mat-theme-desktop-applications-merged-dir

mat-theme-desktop-applications-directories:
  file.recurse:
    - name: /usr/share/desktop-directories/
    - source: salt://mat/theme/desktop/applications/
    - include_pat: '*.directory'
    - user: root
    - group: root
    - file_mode: 644
    - require:
      - file: mat-theme-desktop-applications-menus

mat-theme-desktop-applications-desktop-files:
  file.recurse:
    - name: /usr/share/applications/
    - source: salt://mat/theme/desktop/applications/
    - include_pat: '*.desktop'
    - user: root
    - group: root
    - file_mode: 644
    - require:
      - file: mat-theme-desktop-applications-directories

mat-theme-desktop-applications-icons:
  file.recurse:
    - name: /usr/share/icons/
    - source: salt://mat/theme/desktop/applications/
    - include_pat:
      - '*.png'
      - '*.xpm'
      - '*.svg'
    - user: root
    - group: root
    - file_mode: 644
    - watch:
      - file: mat-theme-desktop-applications-desktop-files
    - require:
      - sls: mat.tools.cyberchef
      - sls: mat.tools.jadx

mat-theme-desktop-applications-firefox:
  file.append:
    - name: /etc/environment
    - text: "MOZ_ENABLE_WAYLAND=1"
