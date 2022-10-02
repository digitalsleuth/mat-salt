include:
    - mat.addon
    - mat.theme

mat-screenlock-disabled:
  cmd.run:
    - name: 'gsettings set org.gnome.desktop.screensaver lock-enabled false'

mat-dedicated:
  test.nop:
    - require:
      - sls: mat.addon
      - sls: mat.theme


