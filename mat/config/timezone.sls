{%- set timezone = salt['pillar.get']('mat_timezone', 'Etc/UTC') -%}
{% if salt['file.file_exists']('/.dockerenv') %}

running-in-docker-not-setting-timezone:
  test.nop

{% else %}

{{ timezone }}:
  timezone.system

{% endif %}
