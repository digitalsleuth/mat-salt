include:
  - mat.scripts.androguard-report
  - mat.scripts.binarycookiereader
  - mat.scripts.cheeky4n6monkey
  - mat.scripts.dnschef
  - mat.scripts.frida-ios-dump
  - mat.scripts.frida-ipa-dump
  - mat.scripts.ios-sms-parser
  - mat.scripts.ios-sysdiagnose
  - mat.scripts.itunes_backup2hashcat
  - mat.scripts.kobackupdec
  - mat.scripts.koodous-scripts
  - mat.scripts.pidcat
  - mat.scripts.sqlite-miner

mat-scripts:
  test.nop:
    - require:
      - sls: mat.scripts.androguard-report
      - sls: mat.scripts.binarycookiereader
      - sls: mat.scripts.cheeky4n6monkey
      - sls: mat.scripts.dnschef
      - sls: mat.scripts.frida-ios-dump
      - sls: mat.scripts.frida-ipa-dump
      - sls: mat.scripts.ios-sms-parser
      - sls: mat.scripts.ios-sysdiagnose
      - sls: mat.scripts.itunes_backup2hashcat
      - sls: mat.scripts.kobackupdec
      - sls: mat.scripts.koodous-scripts
      - sls: mat.scripts.pidcat
      - sls: mat.scripts.sqlite-miner
