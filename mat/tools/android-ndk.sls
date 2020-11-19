# Name:
# Website:
# Description:
# Category:
# Author:
# License:
# Notes:

{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.config.android-ndk
#  - mat.tools.android-studio

mat-tools-android-ndk-source:
  file.managed:
    - name: /usr/local/src/mat/files/android-ndk-r21d-linux-x86_64.zip
    - source: https://dl.google.com/android/repository/android-ndk-r21d-linux-x86_64.zip
    - source_hash: sha256=dd6dc090b6e2580206c64bcee499bc16509a5d017c6952dcd2bed9072af67cbd
    - makedirs: True

mat-tools-android-ndk-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/android-ndk-r21d-linux-x86_64.zip
    - enforce_toplevel: True
    - watch:
      - file: mat-tools-android-ndk-source
#    - require:
#      - sls: mat.tools.android-studio
