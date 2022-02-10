# Name: dnschef
# Website: https://github.com/iphelix/dnschef
# Description: DNS Proxy
# Category: Scripts
# Author: Peter Kacherginsky, Marcello Salvati
# License: BSD 3-Clause (https://github.com/iphelix/dnschef/blob/master/LICENSE)
# Notes: dnschef

{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.apt-packages.python3
  - mat.python3-packages.dnslib
  - mat.config.user.user

mat-scripts-dnschef-source:
  file.managed:
    - name: /usr/local/bin/dnschef.py
    - source: https://github.com/iphelix/dnschef/raw/master/dnschef.py
    - source_hash: sha256=126bc70a88c8a38d723ed78c1c31046d924e63597edf59ce0228681c4986affa
    - mode: 755
    - require:
      - sls: mat.apt-packages.python3
      - sls: mat.python3-packages.dnslib

mat-scripts-dnschef-config:
  file.managed:
    - name: {{ home }}/.dnschef.ini
    - source: https://github.com/iphelix/dnschef/raw/master/dnschef.ini
    - source_hash: sha256=37bbf04a1c77191a2979298cf481dac9cd4affb0a7fa4e210d53cdcd6c2a4a34
    - mode: 644
    - user: {{ user }}
    - group: {{ user }}
    - watch:
      - file: mat-scripts-dnschef-source
    - require:
      - user: mat-user-{{ user }}
