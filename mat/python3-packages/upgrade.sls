include:
  - mat.apt-packages.python3-pip
  - mat.python3-packages.apkid

mat-python3-packages-upgrade:
  cmd.run:
    - name: python3 -m pip install --upgrade chepy chepy[extras]

mat-python3-packages-upgrade-apkid:
  cmd.run:
    - name: /opt/apkid/bin/python3 -m pip install --upgrade apkid
    - require:
      - sls: mat.python3-packages.apkid
