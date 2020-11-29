{% set desktop_items = ['libreoffice-calc.dockitem','libreoffice-writer.dockitem','org.gnome.Software.dockitem', 'org.gnome.Geary.desktop', 'nemo.dockitem'] %}
{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.config.user
  - mat.theme.desktop.ubuntu-budgie-desktop

{% for item in desktop_items %}
mat-theme-desktop-plank-config-clean-{{ item }}:
  file.absent:
    - name: {{ home }}/.config/plank/dock1/launchers/{{ item }}
    - require:
      - user: mat-user-{{ user }}
{% endfor %}

mat-theme-desktop-plank-config:
  file.recurse:
    - source: salt://mat/theme/desktop/plank
    - name: {{ home }}/.config/plank/dock1/launchers/
    - file_mode: 644
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - user: mat-user-{{ user }}
      - sls: mat.theme.desktop.ubuntu-budgie-desktop

