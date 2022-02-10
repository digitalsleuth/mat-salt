# Name: Android NDK
# Website:
# Description:
# Category:
# Author:
# License:
# Notes:

{% set prev_version = "android-ndk-r22d-linux-x86_64.zip" %}
{% set curr_version = "android-ndk-r23b-linux.zip" %}
{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.config.user

mat-tools-android-ndk-source:
  file.managed:
    - name: /usr/local/src/mat/files/{{ curr_version }}
    - source: https://dl.google.com/android/repository/{{ curr_version }}
    - source_hash: sha256=c6e97f9c8cfe5b7be0a9e6c15af8e7a179475b7ded23e2d1c1fa0945d6fb4382
    - makedirs: True

mat-tools-android-ndk-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/{{ curr_version }}
    - enforce_toplevel: True
    - watch:
      - file: mat-tools-android-ndk-source
    - require:
      - user: mat-user-{{ user }}

mat-tools-android-ndk-cleanup:
  file.absent:
    - name: /usr/local/src/mat/files/{{ prev_version }}
    - watch:
      - archive: mat-tools-android-ndk-archive
