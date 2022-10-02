# Name:
# Website:
# Description:
# Category:
# Author:
# License: 
# Notes:

{% set prev_versions = [("android-studio-2021.1.1.21-linux.tar.gz"), ("android-studio-ide-201.6953283-linux.tar.gz")] %}
{% set zip = "android-studio-2021.2.1.16-linux.tar.gz" %}
{% set version = "2021.2.1.16" %}
{% set hash = "aa5773a9e1da25bdb2367a8bdd2b623dbe0345170ed231a15b3f40e8888447dc" %}

include:
  - mat.tools.android-ndk

mat-tools-android-studio-source:
  file.managed:  
    - name: /usr/local/src/mat/files/{{ zip }}
    - source: https://redirector.gvt1.com/edgedl/android/studio/ide-zips/{{ version }}/{{ zip }}
    - source_hash: sha256={{ hash }}
    - makedirs: True

mat-tools-android-studio-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/{{ zip }}
    - enforce_toplevel: True
    - watch:
      - file: mat-tools-android-studio-source
    - require:
      - sls: mat.tools.android-ndk

mat-tools-android-studio-wrapper:
  file.managed:
    - name: /usr/local/bin/studio.sh
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - bash /usr/local/android-studio/bin/studio.sh "${*}"
    - watch:
      - archive: mat-tools-android-studio-archive

{% for prev_version in prev_versions %}

mat-tools-android-studio-upgrade-cleanup-{{ prev_version }}:
  file.absent:
    - name: /usr/local/src/mat/files/{{ prev_version }}
    - watch:
      - file: mat-tools-android-studio-wrapper

{% endfor %}
