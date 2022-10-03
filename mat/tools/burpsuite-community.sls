# Name: Burp Suite Community Edition
# Website: https://portswigger.net
# Description: Intercept web interactions via proxy
# Category: 
# Author: PortSwigger
# License: Free, custom license (https://portswigger.net/burp/tc-community)
# Notes: burpsuite

{% set version = '2022.8.5' %}
{% set hash = 'C9B33AE237BF33C1DC0FE68B029FDFBE092BBA39FE96ED376AD10A1E287E113D' %}

include:
  - mat.apt-packages.default-jre

burpsuite-community-download:
  file.managed:
    - name: /usr/local/src/mat/files/burpsuite_community-{{ version }}.sh
    - source: 'https://portswigger-cdn.net/burp/releases/download?product=community&version={{ version }}&type=Linux'
    - source_hash: sha256={{ hash }}
    - makedirs: True

burpsuite-community-install:
  cmd.run:
    - name: bash /usr/local/src/mat/files/burpsuite_community-{{ version }}.sh -q -dir /usr/local/src/mat/burpsuite
    - require:
      - sls: mat.apt-packages.default-jre
    - watch:
      - file: burpsuite-community-download

burpsuite-community-wrapper:
  file.managed:
    - name: /usr/local/bin/burpsuite-community
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - java -jar /usr/local/src/mat/burpsuite/burpsuite_community.jar "${*}"
    - watch:
      - cmd: burpsuite-community-install

burpsuite-icon:
  file.managed:
    - name: /usr/share/icons/burpsuite.png
    - source: /usr/local/src/mat/burpsuite/.install4j/BurpSuiteCommunity.png
    - mode: 755
    - makedirs: True
    - require:
      - cmd: burpsuite-community-install
