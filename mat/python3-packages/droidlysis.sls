# Name: DroidLysis
# Website: https://github.com/cryptax/droidlysis
# Description: Property extractor for Android apps
# Category:
# Author: cryptax
# License: MIT License: https://github.com/cryptax/droidlysis/blob/master/LICENSE
# Notes: droidlysis

include:
  - mat.apt-packages.unzip
  - mat.tools.apktool
  - mat.apt-packages.python2-pip
  - mat.apt-packages.python3-pip
  - mat.apt-packages.baksmali
  - mat.apt-packages.dex2jar
  - mat.apt-packages.procyon-decompiler
  - mat.apt-packages.default-jre

mat-python3-packages-droidlysis:
  pip.installed:
    - name: droidlysis
    - upgrade: True
    - bin_env: /usr/bin/python3
    - require:
      - sls: mat.apt-packages.unzip
      - sls: mat.tools.apktool
      - sls: mat.apt-packages.python3-pip
      - sls: mat.apt-packages.baksmali
      - sls: mat.apt-packages.dex2jar
      - sls: mat.apt-packages.procyon-decompiler
      - sls: mat.apt-packages.default-jre

mat-python3-packages-droidlysis-apktool-cfg:
  file.replace:
    - name: /usr/local/lib/python3.6/dist-packages/droidconfig.py
    - pattern: '^APKTOOL_JAR.*$'
    - repl: 'APKTOOL_JAR = os.path.join(os.path.expanduser("/usr/local/apktool"), "apktool_2.4.1.jar")'
    - count: 1
    - prepend_if_not_found: False
    - require:
      - pip: mat-python3-packages-droidlysis

mat-python3-packages-droidlysis-baksmali-cfg:
  file.replace:
    - name: /usr/local/lib/python3.6/dist-packages/droidconfig.py
    - pattern: '^BAKSMALI_JAR.*$'
    - repl: 'BAKSMALI_JAR = os.path.join(os.path.expanduser("/opt/baksmali"), "baksmali-2.4.0.jar")'
    - count: 1
    - prepend_if_not_found: False
    - require:
      - pip: mat-python3-packages-droidlysis

mat-python3-packages-droidlysis-dex2jar-cfg:
  file.replace:
    - name: /usr/local/lib/python3.6/dist-packages/droidconfig.py
    - pattern: '^DEX2JAR_CMD.*$'
    - repl: 'DEX2JAR_CMD = os.path.join(os.path.expanduser("/usr/bin"), "d2j-dex2jar")'
    - count: 1
    - prepend_if_not_found: False
    - require:
      - pip: mat-python3-packages-droidlysis

mat-python3-packages-droidlysis-procyon-cfg:
  file.replace:
    - name: /usr/local/lib/python3.6/dist-packages/droidconfig.py
    - pattern: '^PROCYON_JAR.*$'
    - repl: 'PROCYON_JAR = os.path.join(os.path.expanduser("/usr/share/java"), "procyon-decompiler-0.5.32.jar")'
    - count: 1
    - prepend_if_not_found: False
    - require:
      - pip: mat-python3-packages-droidlysis

