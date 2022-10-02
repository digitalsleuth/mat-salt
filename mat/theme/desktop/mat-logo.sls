mat-theme-desktop-logo:
  file.managed:
    - name: /usr/local/share/mat/mat-logo.png
    - source: salt://mat/theme/desktop/mat-logo.png
    - makedirs: True

mat-theme-desktop-start-menu:
  file.managed:
    - name: /usr/local/share/mat/mat-start-menu.svg
    - source: salt://mat/theme/desktop/mat-start-menu.svg
    - makedirs: True

mat-theme-desktop-start-menu-backup:
  file.copy:
    - name: /usr/share/icons/Yaru/scalable/actions/view-app-grid-symbolic.svg.bak
    - source: /usr/share/icons/Yaru/scalable/actions/view-app-grid-symbolic.svg
    - force: True

mat-theme-desktop-start-menu-replace:
  file.copy:
    - name: /usr/share/icons/Yaru/scalable/actions/view-app-grid-symbolic.svg
    - source: /usr/local/share/mat/mat-start-menu.svg
    - force: True
    - require:
      - file: mat-theme-desktop-start-menu-backup
      - file: mat-theme-desktop-start-menu
