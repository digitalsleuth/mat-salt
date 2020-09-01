include:
  - mat.config.user
  - mat.config.salt-minion
  - mat.config.sudoers
  - mat.config.bashrc
  - mat.config.androind-ndk
  
mat-config:
  test.nop:
    - require:
      - sls: mat.config.user
      - sls: mat.config.salt-minion
      - sls: mat.config.sudoers
      - sls: mat.config.bashrc
      - sls: mat.config.android-ndk
