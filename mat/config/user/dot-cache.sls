{%- set user = salt['pillar.get']('mat_user', 'mat') -%}
{%- if user == "root" -%}
  {%- set home = "/root" -%}
{%- else -%}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.config.user

mat-dot-cache-directory:
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
