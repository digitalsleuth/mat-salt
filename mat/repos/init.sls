include:
  - mat.repos.sift
  - mat.repos.gift
  - mat.repos.remnux
  - mat.repos.docker
  - mat.repos.universe
  - mat.repos.nodejs
  - mat.repos.openjdk
  
mat-repos:
  test.nop:
    - require:
      - sls: mat.repos.sift
      - sls: mat.repos.gift
      - sls: mat.repos.remnux
      - sls: mat.repos.docker
      - sls: mat.repos.universe
      - sls: mat.repos.nodejs
      - sls: mat.repos.openjdk
