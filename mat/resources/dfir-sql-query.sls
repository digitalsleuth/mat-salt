{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.apt-packages.git
  - mat.apt-packages.cherrytree
  - mat.config.user

mat-resources-dfir-sql-query-source:
  git.cloned:
    - name: https://github.com/digitalsleuth/dfir-sql-query-repo.git
    - target: {{ home }}/dfir-sql-query
    - require:
      - sls: mat.apt-packages.git
      - sls: mat.config.user

mat-resources-dfir-sql-query-permissions:
  file.directory:
    - name: {{ home }}/dfir-sql-query
    - user: {{ user }}
    - group: {{ user }}
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - watch:
      - git: mat-resources-dfir-sql-query-source
    - require:
      - sls: mat.config.user

mat-resources-dfir-sql-query-wrapper:
  file.managed:
    - name: /usr/local/bin/dfir-sql
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - cherrytree {{ home }}/dfir-sql-query/dfir-sql-query.ctb &
    - watch:
      - git: mat-resources-dfir-sql-query-source
    - require:
      - sls: mat.apt-packages.cherrytree
