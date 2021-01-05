#!/bin/bash
MENU_INSTANCE=$(dconf list /org/solus-project/budgie-panel/instance/budgie-menu/ | grep -Eo [0-9a-f\-]{36})

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
gsettings set net.launchpad.plank.dock.settings:/net.launchpad.plank.docks.dock1/ position 'left'
gsettings set net.launchpad.plank.dock.settings:/net.launchpad.plank.docks.dock1/ theme 'Transparent'
gsettings set com.solus-project.budgie-menu:/ menu-label 'mat'
gsettings set com.solus-project.budgie-menu:/ enable-menu-label 'true'
gsettings set com.gexperts.Tilix.Settings use-tabs 'true'
gsettings set com.solus-project.budgie-raven show-power-strip 'true'
gsettings set io.elementary.desktop.wingpanel.applications-menu enable-powerstrip 'true'
gsettings set io.elementary.desktop.wingpanel.applications-menu use-category 'true'
dconf write /org/solus-project/budgie-panel/instance/budgie-menu/{$MENU_INSTANCE}/enable-menu-label true
dconf write /org/solus-project/budgie-panel/instance/budgie-menu/{$MENU_INSTANCE}/menu-label \'mat\'
dconf write /net/launchpad/plank/docks/dock1/position \'left\'
