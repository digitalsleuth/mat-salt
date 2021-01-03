# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: 

mat-tools-jad-source:
  file.managed:
    - name: /usr/local/src/mat/files/jad158e.linux.static.zip
    - source: salt://mat/files/jad158e.linux.static.zip
    - source_hash: sha256=2878e19fc1fdd725b516f538a57b02aaec1b2d1e4b106d550230381ffa9c0c81
    - makedirs: True

mat-tools-jad-archive:
  archive.extracted:
    - name: /usr/local/src/mat/jad-1.5.8
    - source: /usr/local/src/mat/files/jad158e.linux.static.zip
    - enforce_toplevel: False
    - watch:
      - file: mat-tools-jad-source

mat-tools-jad-bin:
  file.managed:
    - name: /usr/local/bin/jad
    - mode: 755
    - source: /usr/local/src/mat/jad-1.5.8/jad
    - watch: 
      - archive: mat-tools-jad-archive
