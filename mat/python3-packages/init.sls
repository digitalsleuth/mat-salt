include:
  - mat.python3-packages.androguard
  - mat.python3-packages.androwarn
  #- mat.python3-packages.apkid
  - mat.python3-packages.droidlysis
  - mat.python3-packages.frida
  - mat.python3-packages.objection
  - mat.python3-packages.pyperclip
  - mat.python3-packages.qark
  - mat.python3-packages.smalisca
  - mat.python3-packages.yara-python

mat-python3-packages:
  test.nop:
    - require:
      - sls: mat.python3-packages.androguard
      - sls: mat.python3-packages.androwarn
      #- sls: mat.python3-packages.apkid
      - sls: mat.python3-packages.droidlysis
      - sls: mat.python3-packages.frida
      - sls: mat.python3-packages.objection
      - sls: mat.python3-packages.pyperclip
      - sls: mat.python3-packages.qark
      - sls: mat.python3-packages.smalisca
      - sls: mat.python3-packages.yara-python
