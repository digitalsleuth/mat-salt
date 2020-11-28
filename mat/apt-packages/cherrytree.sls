{% if grains['oscodename'] == "bionic" %}

include:
  - mat.apt-packages.libcanberra-gtk-module

cherrytree:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.libcanberra-gtk-module

{% elif grains['oscodename'] == "focal" %}

include:
  - mat.repos.giuspen
  - mat.apt-packages.libcanberra-gtk-module

cherrytree:
  pkg.installed:
    - require:
      - sls: mat.apt-packages.libcanberra-gtk-module
      - sls: mat.repos.giuspen

{% endif %}
