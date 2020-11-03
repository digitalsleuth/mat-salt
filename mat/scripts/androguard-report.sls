include:
  - mat.apt-packages.python3-pip
  - mat.apt-packages.python2-pip
  - mat.python2-packages.requests

mat-scripts-androguard-report:
  file.managed:
    - name: /usr/local/bin/download_androguard_report.py
    - source: https://github.com/Koodous/androguard-yara/raw/master/download_androguard_report.py
    - source_hash: sha256=72ecb4924f9f7aec8e60904c58e33b733249358c1b77541bcdfe7b028a15eaaf
    - mode: 755
    - require:
      - sls: mat.python2-packages.requests
      - sls: mat.apt-packages.python2-pip
