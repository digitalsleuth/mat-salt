{% if salt['file.file_exists']('/sbin/runlevel') %}

salt-minion:
  service.dead:
    - name: salt-minion
    - enable: False

{% endif %}

else-salt-inside-docker:
  test.nop
