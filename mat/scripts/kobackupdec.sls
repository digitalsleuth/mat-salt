include:
  - mat.python3-packages.pycryptodome

mat-scripts-kobackupdec:
  file.managed:
    - name: /usr/local/bin/kobackupdec.py
    - source: https://github.com/RealityNet/kobackupdec/raw/master/kobackupdec.py
    - source_hash: aec6b5b8d96e14321e7426261af86dc86ddafd75b58186c02fb1d8d42f1c847d
    - mode: 755
    - require:
      - sls: mat.python3-packages.pycryptodome
