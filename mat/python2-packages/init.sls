include:
  - mat.python2-packages.drozer
  - mat.python2-packages.pymongo
  - mat.python2-packages.python-magic
  - mat.python2-packages.requests

mat-python2-packages:
  test.nop:
    - require:
      - sls: mat.python2-packages.drozer
      - sls: mat.python2-packages.pymongo
      - sls: mat.python2-packages.python-magic
      - sls: mat.python2-packages.requests
