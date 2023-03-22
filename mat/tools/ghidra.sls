{% set prev_version="ghidra_9.2_PUBLIC_20201113.zip" %}
{% set curr_version="ghidra_10.1.2_PUBLIC_20220125.zip" %}
# Name: Ghidra
# Website: https://ghidra-sre.org
# Description: Reverse engineering toolset
# Category:
# Author: National Security Agency
# License: Apache License 2.0: https://github.com/NationalSecurityAgency/ghidra/blob/master/LICENSE
# Notes: Close CodeBrowser before exiting Ghidra to prevent Ghidra from freezing when you reopen the tool (it's a Ghidra bug).

include:
  - mat.apt-packages.default-jdk

mat-tools-ghidra-source:
  file.managed:
    - name: /usr/local/src/mat/files/{{ curr_version }}
    - source: https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.2_build/{{ curr_version }}
    - source_hash: sha256=ac96fbdde7f754e0eb9ed51db020e77208cdb12cf58c08657a2ab87cb2694940
    - makedirs: true
    - require:
      - sls: mat.apt-packages.default-jdk

mat-tools-ghidra-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/{{ curr_version }}
    - enforce_toplevel: true
    - trim_output: True
    - watch:
      - file: mat-tools-ghidra-source

/usr/local/bin/ghidra:
  file.symlink:
    - target: /usr/local/ghidra_10.1.2_PUBLIC/ghidraRun
    - watch:
      - archive: mat-tools-ghidra-archive

mat-tools-ghidra-upgrade-cleanup:
  file.absent:
    - name: /usr/local/src/mat/files/{{ prev_version }}
    - watch:
      - file: /usr/local/bin/ghidra
