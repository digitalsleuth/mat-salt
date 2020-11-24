{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.config.user

mat-theme-desktop-autostart-tilix:
  file.copy:
    - name: {{ home }}/.config/autostart/com.gexperts.Tilix.desktop
    - source: /usr/share/applications/com.gexperts.Tilix.desktop
    - require:
      - user: mat-user-{{ user }}
