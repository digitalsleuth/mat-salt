include:
  - mat.config.user.user
  - mat.config.user.bashrc
  - mat.config.user.android-ndk
  - mat.config.user.flexdecrypt-folder
  - mat.config.user.sudoers

mat-config-user:
  test.nop:
    - require:
      - sls: mat.config.user.user
      - sls: mat.config.user.bashrc
      - sls: mat.config.user.android-ndk
      - sls: mat.config.user.flexdecrypt-folder
      - sls: mat.config.user.sudoers
