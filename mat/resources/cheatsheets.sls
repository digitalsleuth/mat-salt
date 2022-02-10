{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.config.user

mat-resources-cheatsheets-smartphone:
  file.managed:
    - name: {{ home }}/references/DFIR-Smartphone-Forensics-Poster.pdf
    - source: https://assets.contentstack.io/v3/assets/blt36c2e63521272fdc/blt83bf07bbc4a716d9/Smartphone_Forensics_Poster.pdf
    - source_hash: sha256=98c9be2bc34e52ebb0448741d08f0c7fb44a2aba7d8e2232005f64b0bb6c7006
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - show_changes: False
    - require:
      - user: mat-user-{{ user }}

mat-resources-cheatsheets-sqlite:
  file.managed:
    - name: {{ home }}/references/SQlite-PocketReference-final.pdf
    - source: https://assets.contentstack.io/v3/assets/blt36c2e63521272fdc/blt4698e96e2d9cf51d/SQlite_Cheat_Sheet.pdf
    - source_hash: sha256=954d62787abe3bad95f59e2d671eac202dea2607ed5cdb757dbbb688b873f679
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - show_changes: False
    - require:
      - user: mat-user-{{ user }}

mat-resources-cheatsheets-mobile-device:
  file.managed:
    - name: {{ home }}/references/mobile-device-forensic-process-v3.pdf
    - source: https://sansorg.egnyte.com/dd/lpIZSVtbFu
    - source_hash: sha256=d71562eff2f4684c67b541fce9d14c0bff2247a073f529299ad9969cb1ce87c8
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - show_changes: False
    - require:
      - user: mat-user-{{ user }}

mat-resources-cheatsheets-FOR518:
  file.managed:
    - name: {{ home }}/references/FOR518-Reference-Sheet.pdf
    - source: https://sansorg.egnyte.com/dd/zngSJguNqj
    - source_hash: sha256=f2b628cf2c9ed441c353fe6bb07157d8617d15b97d705de6c82f7d3d1d35d909
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - show_changes: False
    - require:
      - user: mat-user-{{ user }}

mat-resources-cheatsheets-FOR585:
  file.managed:
    - name: {{ home }}/references/FOR585-Reference-Sheet.pdf
    - source: https://sansorg.egnyte.com/dd/ljmbARD8io
    - source_hash: sha256=98c9be2bc34e52ebb0448741d08f0c7fb44a2aba7d8e2232005f64b0bb6c7006
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
    - show_changes: False
    - require:
      - user: mat-user-{{ user }}


