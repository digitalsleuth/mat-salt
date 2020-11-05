include:
  - mat.scripts.androguard-report
  - mat.scripts.binarycookiereader
  - mat.scripts.frida-ios-dump
  - mat.scripts.frida-ipa-dump
  - mat.scripts.koodous-scripts
  - mat.scripts.pidcat

mat-scripts:
  test.nop:
    - require:
      - sls: mat.scripts.androguard-report
      - sls: mat.scripts.binarycookiereader
      - sls: mat.scripts.frida-ios-dump
      - sls: mat.scripts.frida-ipa-dump
      - sls: mat.scripts.koodous-scripts
      - sls: mat.scripts.pidcat