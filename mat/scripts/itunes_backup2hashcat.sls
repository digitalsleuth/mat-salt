# Name: itunes_backup2hashcat
# Website: https://github.com/philsmd/itunes_backup2hashcat
# Description: Convert iOS Manifest.plist hashes to hashcat
# Category: iOS
# Author: philsmd
# License: Public Domain (https://github.com/philsmd/itunes_backup2hashcat#licensedisclaimer)
# Notes: itunes_backup2hashcat

include:
  - mat.apt-packages.perl

mat-scripts-itunes-backup2hashcat-source:
  file.managed:
    - name: /usr/local/bin/itunes_backup2hashcat.pl
    - source: https://github.com/philsmd/itunes_backup2hashcat/raw/master/itunes_backup2hashcat.pl
    - source_hash: sha256=5aee8a5889c1c15c7804ef1539f357ada36235aa2450089f2a2f7083ee480e8c
    - mode: 755
    - require:
      - sls: mat.apt-packages.perl
