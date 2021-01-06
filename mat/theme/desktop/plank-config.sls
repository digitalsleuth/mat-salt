{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.config.user
  - mat.theme.desktop.ubuntu-budgie-desktop

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

