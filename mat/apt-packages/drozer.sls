# Name: drozer
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

mat-apt-packages-drozer-source:
  file.managed:
    - name: /usr/local/src/mat/files/drozer_2.4.4.deb
    - source: https://github.com/mwrlabs/drozer/releases/download/2.4.4/drozer_2.4.4.deb
    - source_hash: sha256=22264dfdea5429e6361644c8acbbe06fcbc0d792c3b1a83092b37eaa1749c97c
    - mode: 755

mat-apt-packages-drozer-install:
  pkg.installed:
    - sources:
      - drozer: /usr/local/src/mat/files/drozer_2.4.4.deb
    - watch:
      - file: mat-apt-packages-drozer-source

mat-apt-packages-drozer-cleanup:
  file.absent:
    - name: /usr/local/src/mat/files/drozer_2.4.4.deb
    - watch:
      - pkg: mat-apt-packages-drozer-install
