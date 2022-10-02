# Name: JD-GUI Java Decompiler
# Website: https://java-decompiler.github.io/
# Description: Java decompiler with GUI
# Category: 
# Author: Emmanuel Dupuy
# License: GNU General Public License (GPL) v3 (https://github.com/java-decompiler/jd-gui/blob/master/LICENSE)
# Notes: jd-gui

{% set version = '1.6.6' %}
{% set hash = '8bfa359653002346d4e370e7e8e12805b6f8e114ff83093944c6c3cdb1d71732' %}

include:
  - mat.apt-packages.xdg-utils

mat-xdg-directory-create:
  file.directory:
    - names: 
      - /usr/share/desktop-directories/
      - /usr/share/icons/hicolor/    
    - user: root
    - group: root
    - mode: 755
    - makedirs: true
    - watch:
      - sls: mat.apt-packages.xdg-utils

mat-jd-gui-download:
  file.managed:
    - name: /usr/local/src/mat/files/jd-gui-{{ version }}.deb
    - source: https://github.com/java-decompiler/jd-gui/releases/download/v{{ version }}/jd-gui-{{ version }}.deb
    - source_hash: sha256={{ hash }}
    - makedirs: True

jd-gui:
  pkg.installed:
    - sources:
      - jd-gui: /usr/local/src/mat/files/jd-gui-{{ version }}.deb
    - watch:
      - file: mat-jd-gui-download
