include:
  - mat.apt-packages.git
  - mat.apt-packages.cherrytree

mat-resources-dfir-sql-query-source:
  git.cloned:
    - name: https://github.com/digitalsleuth/dfir-sql-query-repo.git
    - target: /usr/local/src/dfir-sql-query
    - require:
      - sls: mat.apt-packages.git

mat-resources-dfir-sql-query-wrapper:
  file.managed:
    - name: /usr/local/bin/dfir-sql
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - cherrytree /usr/local/src/dfir-sql-query/dfir-sql-query.ctb &
    - watch:
      - git: mat-resources-dfir-sql-query-source
    - require:
      - sls: mat.apt-packages.cherrytree
