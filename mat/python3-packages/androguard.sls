include:
  - mat.packages.python-pip
  - mat.packages.python3-pip
  - mat.packages.python3-pyqt5
  - mat.python3-packages.pyperclip

mat-python3-packages-androguard:
  pip.installed:
    - name: androguard
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.packages.python3-pip
      - sls: mat.packages.python3-pyqt5
      - sls: mat.python3-packages.pyperclip
