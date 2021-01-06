{% set user = salt['pillar.get']('mat_user', 'mat') %}

{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

{% set all_users = salt['user.list_users']() %} 

{% if user in all_users %}
include:
  - mat.config.user.sudoers

mat-user-{{ user }}:
  user.present:
    - name: {{ user }}
    - home: {{ home }}
{% else %}

mat-user-{{ user }}:
  group.present:
    - name: {{ user }}
  user.present:
    - name: {{ user }}
    - gid: {{ user }}
    - fullname: MAT User
    - shell: /bin/bash
    - home: {{ home }}
    - password: $6$YKzrzcRTQ1418osj$ndiuDvWBTpa/FHtGoYBz6jsJJ5DfHj.XErh31mmKvoECZtMLnIFfVbDKuedj4YMmRc0oWE0QIeFUR6pbOpXjS.
{% endif %}


