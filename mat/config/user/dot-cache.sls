{%- set user = salt['pillar.get']('mat_user', 'mat') -%}

{% if user != "root" %}
  {% set home = "/home/" + user %}

include:
  - mat.config.user

mat-dot-cache-permissions:
  file.directory:
    - name: {{ home }}/.cache
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - recurse:
      - user
      - group
    - require:
      - user: mat-user-{{ user }}

{% endif %}
