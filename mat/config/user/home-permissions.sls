{%- set user = salt['pillar.get']('mat_user', 'mat') -%}
{% if user != "root" %}
  {% set home = "/home/" + user  %}

include:
  - mat.config.user

mat-config-user-home-permissions:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - name: {{ home }}
    - recurse:
      - user
      - group
    - require:
      - user: mat-user-{{ user }}

{% endif %}
