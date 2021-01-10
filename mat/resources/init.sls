include:
  - mat.resources.dfir-sql-query
  - mat.resources.cheatsheets

mat-resources:
  test.nop:
    - require:
      - sls: mat.resources.dfir-sql-query
      - sls: mat.resources.cheatsheets
