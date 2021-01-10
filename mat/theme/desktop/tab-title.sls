{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user  %}
{% endif %}

include:
  - mat.config.user.user

mat-theme-desktop-bashrc:
  file.managed:
    - name: {{ home }}/.bashrc
    - user: {{ user }}
    - group: {{ user }}
    - replace: False
    - require:
      - user: mat-user-{{ user }}

mat-theme-desktop-tab-title:
  file.append:
    - name: {{ home }}/.bashrc
    - text: | 
        function tab-title() {
          if [[ -z "$ORIG" ]]; then
            ORIG=$PS1
          fi
          TITLE="\[\e]2;$*\a\]"
          PS1=${ORIG}${TITLE}
        }
    - watch:
      - file: mat-theme-desktop-bashrc
    - require:
      - user: mat-user-{{ user }}

mat-theme-desktop-source-bashrc:
  cmd.run:
    - name: /bin/bash -c "source {{ home }}/.bashrc"
    - runas: {{ user }}
    - require:
      - user: mat-user-{{ user }}
