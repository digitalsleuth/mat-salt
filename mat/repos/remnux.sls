{%- if grains['oscodename'] == "bionic" %}
remnux-repo:
  pkgrepo.managed:
    - ppa: remnux/stable
    - refresh: true
    - keyid_ppa: true

{%- elif grains['oscodename'] == "focal" %}
remnux-repo:
  test.nop

{%- endif %}
