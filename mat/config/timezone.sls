{%- set timezone = salt['pillar.get']('mat_timezone', 'Etc/UTC') -%}

{{ timezone }}:
  timezone.system
