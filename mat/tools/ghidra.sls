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
    - name: /usr/local/src/mat/files/ghidra_9.2_PUBLIC_20201113.zip
    - source: https://ghidra-sre.org/ghidra_9.2_PUBLIC_20201113.zip
    - source_hash: sha256=ffebd3d87bc7c6d9ae1766dd3293d1fdab3232a99b170f8ea8b57497a1704ff6
    - makedirs: true
    - require:
      - sls: mat.apt-packages.default-jdk

mat-tools-ghidra-archive:
  archive.extracted:
    - name: /usr/local/
    - source: /usr/local/src/mat/files/ghidra_9.2_PUBLIC_20201113.zip
    - enforce_toplevel: true
    - watch:
      - file: mat-tools-ghidra-source

/usr/local/bin/ghidra:
  file.symlink:
    - target: /usr/local/ghidra_9.2_PUBLIC/ghidraRun
    - watch:
      - archive: mat-tools-ghidra-archive
