include:
    - mat.addon
    - mat.theme

mat-dedicated-version-file:
  file.managed:
    - name: /etc/mat-version
    - source: salt://VERSION
    - user: root
    - group: root
    - require:
      - sls: mat.addon
      - sls: mat.theme
