{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.tools.android-ndk
  - mat.config.user

mat-config-android-ndk-bashrc:
  file.append:
    - name: {{ home }}/.bashrc
    - text: 'export ANDROID_NDK=/usr/local/android-ndk-r23b'
    - require:
      - user: mat-user-{{ user }}
      - sls: mat.tools.android-ndk
