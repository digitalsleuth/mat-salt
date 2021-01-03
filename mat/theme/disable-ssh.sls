include:
  - mat.apt-packages.openssh

{% if salt['file.file_exists']('/sbin/runlevel') %}

mat-theme-ssh-sshd-disable:
  service.dead:
    - name: ssh
    - enable: False
    - require:
      - sls: mat.apt-packages.openssh

{% endif %}
