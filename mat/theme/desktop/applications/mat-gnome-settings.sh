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
dconf write /net/launchpad/plank/docks/dock1/theme \'Transparent\'
dconf write /com/solus-project/budgie-panel/dark-theme true
dconf write /com/solus-project/budgie-raven/show-mic-input-widget false
dconf write /com/solus-project/budgie-raven/show-mpris-widget false
dconf write /com/solus-project/budgie-raven/show-sound-output-widget false

#Remove excess plank icons which appear on first login
rm ~/.config/plank/dock1/launchers/org.gnome.Software.desktop
rm ~/.config/plank/dock1/launchers/libreoffice-calc.dockitem
rm ~/.config/plank/dock1/launchers/libreoffice-writer.dockitem
rm ~/.config/plank/dock1/launchers/org.gnome.Geary.desktop

