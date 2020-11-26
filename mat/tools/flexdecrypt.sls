# Name: flexdecrypt
# Website: https://github.com/JohnCoates/flexdecrypt
# Description:
# Category:
# Author: 
# License: 
# Notes: Install on iOS device

{%- set user = salt['pillar.get']('mat_user', 'mat') -%}       

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - mat.config.user.user

mat-tools-flexdecrypt-source:
  file.managed:
    - name: {{ home }}/flexdecrypt/flexdecrypt.deb
    - source: https://github.com/JohnCoates/flexdecrypt/releases/download/1.1/flexdecrypt.deb
    - source_hash: sha256=505086536761c07f36dde79a851a43c32baa8b586f75140077580d94cb12a96f
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - user: mat-user-{{ user }}

