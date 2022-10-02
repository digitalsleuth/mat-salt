#!/bin/bash

#Disabling Event Sounds for the system
gsettings set org.gnome.desktop.sound event-sounds false
gsettings set org.gnome.desktop.sound input-feedback-sounds false

#Disabling inactivity timers and screensavers
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.desktop.screensaver lock-enabled false

#Setup color/font scheme
gsettings set org.gnome.shell enabled-extensions "['ubuntu-appindicators@ubuntu.com', 'ubuntu-dock@ubuntu.com', 'desktop-icons@csoriano', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com']"

if [[ $(lsb_release -c -s) == jammy ]]; then
  gsettings set org.gnome.desktop.background picture-uri 'file:///usr/local/share/mat/mat-logo.png'
  gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/local/share/mat/mat-logo.png'
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue-dark'
  gsettings set org.gnome.desktop.interface icon-theme 'Yaru-blue-dark'
  gsettings set org.gnome.shell favorite-apps "['cyberchef.desktop', 'sqlitebrowser.desktop', 'burpsuite.desktop', 'org.gnome.Terminal.desktop', 'jd-qui.desktop', 'cherrytree.desktop', 'org.gnome.Nautilus.desktop', 'firefox_firefox.desktop']"

elif [[ $(lsb_release -c -s) == focal ]]; then
  gsettings set org.gnome.desktop.background draw-background false
  gsettings set org.gnome.desktop.background primary-color '#1644b9'
  gsettings set org.gnome.desktop.background secondary-color '#1644b9'
  gsettings set org.gnome.desktop.background color-shading-type 'solid'
  gsettings set org.gnome.desktop.background picture-uri 'file:///usr/local/share/mat/mat-logo.png'
  gsettings set org.gnome.desktop.background draw-background true
  gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
  gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
  gsettings set org.gnome.shell favorite-apps "['cyberchef.desktop', 'sqlitebrowser.desktop', 'burpsuite.desktop', 'org.gnome.Terminal.desktop', 'jd-qui.desktop', 'cherrytree.desktop', 'org.gnome.Nautilus.desktop', 'firefox.desktop']"
  gsettings set org.gnome.shell.extensions.user-theme name 'Yaru-dark'

fi
gsettings set org.gnome.desktop.background picture-options "zoom"
gsettings set org.gnome.desktop.background primary-color "#1644B9"
gsettings set org.gnome.desktop.screensaver primary-color "#1644B9"

#Customization
gsettings set org.gnome.Terminal.Legacy.Settings theme-variant 'dark'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#A40000'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 36
gsettings set org.gnome.shell.extensions.dash-to-dock apply-glossy-effect false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted true
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
gsettings set org.gnome.desktop.interface enable-animations false
rm /home/$(whoami)/.config/autostart/mat-gnome-settings.desktop
