#!/bin/bash

#Disabling Event Sounds for the system
gsettings set org.gnome.desktop.sound event-sounds false
gsettings set org.gnome.desktop.sound input-feedback-sounds false

#Disabling inactivity timers and screensavers
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.desktop.screensaver lock-enabled false

#Setup color/font scheme
#gsettings set org.gnome.desktop.background picture-uri 'file:///'
#gsettings set org.gnome.desktop.background picture-options
#gsettings set org.gnome.desktop.background primary-color <hex value>
