# Name: Android NDK
# Website:
# Description:
# Category:
# Author:
# License:
# Notes:

{% set prev_version = ["android-ndk-r22d-linux-x86_64.zip","android-ndk-r23b-linux.zip"] %}
{% set curr_version = "android-ndk-r25b-linux.zip" %}
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
    - source_hash: sha256=403AC3E3020DD0DB63A848DCABA6CEB2603BF64DE90949D5C4361F848E44B005
    - makedirs: True

mat-tools-android-ndk-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/{{ curr_version }}
    - enforce_toplevel: True
    - trim_output: True
    - watch:
      - file: mat-tools-android-ndk-source
    - require:
      - user: mat-user-{{ user }}

{% for file in prev_version %}
mat-tools-android-ndk-cleanup-{{ file }}:
  file.absent:
    - name: /usr/local/src/mat/files/{{ file }}
    - watch:
      - archive: mat-tools-android-ndk-archive
  {% endfor %}
