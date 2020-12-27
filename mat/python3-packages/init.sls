include:
  - mat.python3-packages.wheel
  - mat.python3-packages.androguard
  - mat.python3-packages.androwarn
  #- mat.python3-packages.apkid
  - mat.python3-packages.axmlparserpy
  - mat.python3-packages.chepy
  - mat.python3-packages.construct
  - mat.python3-packages.dnslib
  - mat.python3-packages.droidlysis
  - mat.python3-packages.frida
  - mat.python3-packages.googleplay-api
  - mat.python3-packages.objection
  - mat.python3-packages.protobuf-inspector
  - mat.python3-packages.pycryptodome
  - mat.python3-packages.pyperclip
  - mat.python3-packages.qark
  - mat.python3-packages.smalisca
  - mat.python3-packages.time-decode
  - mat.python3-packages.yara-python

mat-python3-packages:
  test.nop:
    - require:
      - sls: mat.python3-packages.wheel
      - sls: mat.python3-packages.androguard
      - sls: mat.python3-packages.androwarn
      #- sls: mat.python3-packages.apkid
      - sls: mat.python3-packages.axmlparserpy
      - sls: mat.python3-packages.chepy
      - sls: mat.python3-packages.construct
      - sls: mat.python3-packages.dnslib
      - sls: mat.python3-packages.droidlysis
      - sls: mat.python3-packages.frida
      - sls: mat.python3-packages.googleplay-api
      - sls: mat.python3-packages.objection
      - sls: mat.python3-packages.protobuf-inspector
      - sls: mat.python3-packages.pycryptodome
      - sls: mat.python3-packages.pyperclip
      - sls: mat.python3-packages.qark
      - sls: mat.python3-packages.smalisca
      - sls: mat.python3-packages.time-decode
      - sls: mat.python3-packages.yara-python
