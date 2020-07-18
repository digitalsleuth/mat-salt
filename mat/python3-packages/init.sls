include:
  - mat.python3-packages.androguard
  - mat.python3-packages.pyperclip

mat-python3-packages:
  test.nop:
    - require:
      - sls: mat.python3-packages.androguard
      - sls: mat.python3-packages.pyperclip
