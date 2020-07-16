include:
  - mat.packages.python
  - mat.packages.python-pip
  - mat.packages.python3
  - mat.packages.python3-pip

mat-packages:
  test.nop:
    - require:
      - sls: mat.packages.python
      - sls: mat.packages.python-pip
      - sls: mat.packages.python3
      - sls: mat.packages.python3-pip
