include:
  - mat.apt-packages.python3
  - mat.python3-packages.frida

mat-scripts-frida-ipa-dump-source:
  file.managed:
    - name: /usr/local/bin/frida-ipa-dump.py
    - source: https://github.com/integrity-sa/frida-ipa-dump/raw/master/dump.py
    - source_hash: sha256=4cfd22b5c0da62f12601bf02bacd29114d885ed09330468ee417497e26f2030c
    - mode: 755
    - require:
      - sls: mat.apt-packages.python3
      - sls: mat.python3-packages.frida
