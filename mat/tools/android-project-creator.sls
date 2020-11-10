# Not set for install - needs fixes and requirements first

{% set filename="AndroidProjectCreator-1.4-stable-jar-with-dependencies.jar" %}
{% set version="1.4-stable" %}
{% set hash="19c3424f3de4d8e572304036f193e80cc6d7d0341bd3bb11f8a4a09f6203f12e" %}

include:
  - mat.apt-packages.default-jre

mat-tools-android-project-creator-source:
  file.managed:
    - name: /usr/local/src/mat/files/{{ filename }}
    - source: https://github.com/ThisIsLibra/AndroidProjectCreator/releases/download/{{ version }}/{{ filename }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: mat.apt-packages.default-jre

mat-tools-android-project-creator-install:
  cmd.run:
    - name: java -jar /usr/local/src/mat/files/{{ filename }} -install
