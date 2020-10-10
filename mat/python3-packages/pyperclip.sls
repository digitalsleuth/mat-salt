include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.python-pip

mat-python3-packages-pyperclip:
  pip.installed:
    - name: pyperclip
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.python3-pip
