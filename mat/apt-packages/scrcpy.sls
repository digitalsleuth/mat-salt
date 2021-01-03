# Name: 
# Website: 
# Description:
# Category:
# Author: 
# License: 
# Notes: scrcpy is not available on bionic, but it can be built. 

{% if grains['oscodename'] == "focal" %} 

scrcpy:
  pkg.installed

{% elif grains['oscodename'] == "bionic" %}

scrcpy:
  test.nop

{% endif %}
