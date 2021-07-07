{%- set user = salt['pillar.get']('mat_user', 'mat') -%}
{%- if user == "root" -%}
  {%- set home = "/root" -%}
{%- else -%}
  {% set home = "/home/" + user %}
{% endif %}

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
