include:
  - mat.config.user.user
  - mat.config.user.android-ndk
  - mat.config.user.default-jdk
  - mat.config.user.dot-cache
  - mat.config.user.flexdecrypt-folder
  - mat.config.user.sudoers
  - mat.config.user.home-permissions

mat-config-user:
  test.nop:
    - require:
      - sls: mat.config.user.user
      - sls: mat.config.user.android-ndk
      - sls: mat.config.user.default-jdk
      - sls: mat.config.user.dot-cache
      - sls: mat.config.user.flexdecrypt-folder
      - sls: mat.config.user.sudoers
      - sls: mat.config.user.home-permissions
