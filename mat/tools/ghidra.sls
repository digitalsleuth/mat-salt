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
    - name: /usr/local/src/mat/files/ghidra_9.1.2_PUBLIC_20200212.zip
    - source: https://ghidra-sre.org/ghidra_9.1.2_PUBLIC_20200212.zip
    - source_hash: sha256=ebe3fa4e1afd7d97650990b27777bb78bd0427e8e70c1d0ee042aeb52decac61
    - makedirs: true
    - require:
      - sls: mat.apt-packages.default-jdk

mat-tools-ghidra-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/ghidra_9.1.2_PUBLIC_20200212.zip
    - enforce_toplevel: true
    - watch:
      - file: mat-tools-ghidra-source

/usr/local/bin/ghidra:
  file.symlink:
    - target: /usr/local/ghidra_9.1.2_PUBLIC/ghidraRun
    - watch:
      - archive: mat-tools-ghidra-archive
