include:
  - mat.packages.python
  - mat.packages.python-pip
  - mat.packages.python3
  - mat.packages.python3-pip
  - mat.packages.adb
  - mat.packages.sqlite3
  - mat.packages.software-properties-common
  - mat.packages.libswt-gtk-4-java

mat-packages:
  test.nop:
    - require:
      - sls: mat.packages.python
      - sls: mat.packages.python-pip
      - sls: mat.packages.python3
      - sls: mat.packages.python3-pip
      - sls: mat.packages.adb
      - sls: mat.packages.sqlite3
      - sls: mat.packages.software-properties-common
      - sls: mat.packages.libswt-gtk-4-java
