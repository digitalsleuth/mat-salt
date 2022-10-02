# Name: Burp Suite Community Edition
# Website: https://portswigger.net
# Description: Intercept web interactions via proxy
# Category: 
# Author: PortSwigger
# License: Free, custom license (https://portswigger.net/burp/tc-community)
# Notes: burpsuite

{% set version = '2022.8.4' %}
{% set hash = '375a236c87c4c44bfcb00299036c50ed8af595a9576bb586d373c0b497014383' %}

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
