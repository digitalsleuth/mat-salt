#!/bin/bash

#Disabling Event Sounds for the system
gsettings set org.gnome.desktop.sound event-sounds 'false'
gsettings set org.gnome.desktop.sound input-feedback-sounds 'false'

#Disabling inactivity timers and screensavers
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.desktop.screensaver lock-enabled 'false'

#Setup color/font scheme
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/local/share/mat/mat-logo.png'
gsettings set org.gnome.desktop.background picture-options "wallpaper"
gsettings set org.gnome.desktop.background primary-color "#1644B9"
gsettings set org.gnome.desktop.screensaver primary-color "#1644B9"

#Customization
gsettings set com.gexperts.Tilix.Settings use-tabs 'true'
gsettings set com.solus-project.budgie-raven show-power-strip 'true'
gsettings set io.elementary.desktop.wingpanel.applications-menu enable-powerstrip 'true'
gsettings set io.elementary.desktop.wingpanel.applications-menu use-category 'true'
dconf write /net/launchpad/plank/docks/dock1/position \'left\'
