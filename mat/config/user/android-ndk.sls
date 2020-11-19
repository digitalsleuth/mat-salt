{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.config.user
  - mat.tools.android-ndk

mat-config-android-ndk-bashrc:
  file.append:
    - name: {{ home }}/.bashrc
    - text: 'export ANDROID_NDK=/usr/local/android-ndk-r21d'
    - require:
      - user: mat-user-{{ user }}
      - sls: mat.tools.android-ndk
      - sls: mat.config.user
