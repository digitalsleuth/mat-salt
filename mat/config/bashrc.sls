{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user  %}
{% endif %}

include:
  - mat.config.user

mat-config-bashrc:
  file.managed:
    - replace: False
    - name: {{ home }}/.bashrc
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - user: mat-user-{{ user }}
