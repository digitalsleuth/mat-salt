include:
  - mat.scripts.androguard-report
  - mat.scripts.binarycookiereader
  - mat.scripts.cheeky4n6monkey
  - mat.scripts.frida-ios-dump
  - mat.scripts.frida-ipa-dump
  - mat.scripts.ios-sysdiagnose
  - mat.scripts.itunes_backup2hashcat
  - mat.scripts.koodous-scripts
  - mat.scripts.pidcat
  - mat.scripts.sqlite-miner

mat-scripts:
  test.nop:
    - require:
      - sls: mat.scripts.androguard-report
      - sls: mat.scripts.binarycookiereader
      - sls: mat.scripts.cheeky4n6monkey
      - sls: mat.scripts.frida-ios-dump
      - sls: mat.scripts.frida-ipa-dump
      - sls: mat.scripts.ios-sysdiagnose
      - sls: mat.scripts.itunes_backup2hashcat
      - sls: mat.scripts.koodous-scripts
      - sls: mat.scripts.pidcat
      - sls: mat.scripts.sqlite-miner
