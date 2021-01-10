{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.apt-packages.default-jdk
  - mat.config.user

mat-config-default-jdk:
  file.append:
    - name: {{ home }}/.bashrc
    - text: 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64'
    - require:
      - user: mat-user-{{ user }}
      - sls: mat.apt-packages.default-jdk

