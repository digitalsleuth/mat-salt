include:
  - mat.apt-packages.python
  - mat.apt-packages.python-pip
  - mat.apt-packages.python3
  - mat.apt-packages.python3-pip
  - mat.apt-packages.adb
  - mat.apt-packages.sqlite3
  - mat.apt-packages.software-properties-common
  - mat.apt-packages.libswt-gtk-4-java
  - mat.apt-packages.open-vm-tools
  - mat.apt-packages.open-vm-tools-desktop
  - mat.apt-packages.firefox
  - mat.apt-packages.python3-pyqt5
  - mat.apt-packages.default-jre
  - mat.apt-packages.baksmali
  - mat.apt-packages.dex2jar
  - mat.apt-packages.procyon-decompiler

mat-apt-packages:
  test.nop:
    - require:
      - sls: mat.apt-packages.python
      - sls: mat.apt-packages.python-pip
      - sls: mat.apt-packages.python3
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.adb
      - sls: mat.apt-packages.sqlite3
      - sls: mat.apt-packages.software-properties-common
      - sls: mat.apt-packages.libswt-gtk-4-java
      - sls: mat.apt-packages.open-vm-tools
      - sls: mat.apt-packages.open-vm-tools-desktop
      - sls: mat.apt-packages.firefox
      - sls: mat.apt-packages.python3-pyqt5
      - sls: mat.apt-packages.default-jre
      - sls: mat.apt-packages.baksmali
      - sls: mat.apt-packages.dex2jar
      - sls: mat.apt-packages.procyon-decompiler
