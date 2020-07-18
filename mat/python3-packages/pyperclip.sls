include:
  - mat.packages.python3-pip

mat-python3-packages-pyperclip:
  pip.installed:
    - name: pyperclip
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.packages.python3-pip
