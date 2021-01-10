# Name: Android NDK
# Website:
# Description:
# Category:
# Author:
# License:
# Notes:

{% set prev_version = "None" %}
{% set curr_version = "android-ndk-r21d-linux-x86_64.zip" %}
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
    - source_hash: sha256=dd6dc090b6e2580206c64bcee499bc16509a5d017c6952dcd2bed9072af67cbd
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
