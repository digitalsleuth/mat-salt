# Name: dex2jar
# Website: https://github.com/pxb1988/dex2jar
# Description: Examine Dalvik Executable (dex) files.
# Category:
# Author: Panxiaobo
# License: Apache License 2.0 (https://github.com/pxb1988/dex2jar/blob/2.x/LICENSE.txt)
# Notes: dex-tools

{% set version = '2.1' %}
{% set hash = '7A9BDF843D43DE4D1E94EC2E7B6F55825017B0C4A7EE39FF82660E2493A46F08' %}
{% set files = ['d2j_invoke','d2j-apk-sign','d2j-asm-verify','d2j-baksmali','d2j-class-version-switch','d2j-decrypt-string','d2j-dex2jar','d2j-dex2smali','d2j-dex-recompute-checksum','d2j-dex-weaver','d2j-jar2dex','d2j-jar2jasmin','d2j-jar-access','d2j-jar-weaver','d2j-jasmin2jar','d2j-smali','d2j-std-apk'] %}

include:
  - mat.apt-packages.default-jre

dex-tools-download:
  file.managed:
    - name: /usr/local/src/mat/files/dex2jar-{{ version }}.zip
    - source: https://github.com/pxb1988/dex2jar/releases/download/v{{ version }}/dex2jar-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

dex-tools-extract:
  archive.extracted:
    - name: /usr/local/src/mat/
    - source: /usr/local/src/mat/files/dex2jar-{{ version }}.zip
    - enforce_toplevel: False
    - watch:
      - file: dex-tools-download

dex-tools-folder:
  file.rename:
    - name: /usr/local/src/mat/dex-tools
    - source: /usr/local/src/mat/dex-tools-{{ version }}
    - makedirs: True
    - force: True

{% for file in files %}
dex-tools-symlink-{{ file }}:
  file.symlink:
    - name: /usr/local/bin/{{ file }}
    - target: /usr/local/src/mat/dex-tools/{{ file }}.sh
    - mode: 755
    - require:
      - archive: dex-tools-extract

{% endfor %}
