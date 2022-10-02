include:
  - mat.repos.gift
  - mat.repos.docker
  - mat.repos.universe
  - mat.repos.nodejs
  - mat.repos.openjdk
  - mat.repos.giuspen
  
mat-repos:
  test.nop:
    - require:
      - sls: mat.repos.gift
      - sls: mat.repos.docker
      - sls: mat.repos.universe
      - sls: mat.repos.nodejs
      - sls: mat.repos.openjdk
      - sls: mat.repos.giuspen
