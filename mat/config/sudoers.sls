{% set user = salt['pillar.get']('mat_user', 'mat') %}

include:
  - mat.config.user
  - mat.apt-packages.sudo

mat-config-sudoers:
  file.append:
    - name: /etc/sudoers.d/mat
    - text: "{{ user }} ALL=NOPASSWD: ALL\nDefaults env_keep += \"ftp_proxy http_proxy https_proxy no_proxy\""
    - makedirs: True
    - require:
      - user: mat-user-{{ user }}
      - sls: mat.apt-packages.sudo
