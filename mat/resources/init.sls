include:
  - mat.resources.dfir-sql-query

mat-resources:
  test.nop:
    - require:
      - sls: mat.resources.dfir-sql-query
