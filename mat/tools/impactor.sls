include:
  - mat.apt-packages.libatomic1
  - mat.apt-packages.libgtk2
  - mat.apt-packages.libsm6

mat-tools-impactor-source:
  archive.extracted:
    - name: /usr/local/impactor
    - source: https://cydia.saurik.com/api/latest/5
    - source_hash: sha256=23b758162a34c6160021e6f82193df76bfbcc09f9476e492b76b130bb4e9e323
    - archive_format: tar
    - makedirs: True
    - overwrite: True
    - enforce_toplevel: False

/usr/local/bin/impactor:
  file.symlink:
    - target: /usr/local/impactor/Impactor
    - mode: 755
    - watch:
      - archive: mat-tools-impactor-source