{% if grains['oscodename'] == "bionic" %}

libusbmuxd4:
  pkg.installed

{% elif grains['oscodename'] == "focal" %}

libusbmuxd6:
  pkg.installed

{% endif %}
