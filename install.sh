#!/bin/bash

# Required apps:
#   - google-chrome
#   OR
#   - chromium-browser
# (note: these are the binary names in debian/ubuntu -
# if you're using this in Arch or something else, your chromium
# command may be "chromium" without the -browser suffix.)

if [ ! `whoami` == "root" ]
then
    echo "Sorry, this should really be run by root."
    exit 1
fi

if [ ! -f `which google-chrome` -a ! -f `which chromium-browser` ]
then
    echo "You must install google-chrome or chromium-browser to use this app."
    ./exit 2
fi

echo "Copying grooveshark script to /usr/local/bin/"
echo "..."
cp grooveshark /usr/local/bin/
chmod +x /usr/local/bin/grooveshark
echo "Done."

echo "Copying icon to /usr/share/icons/grooveshark/"
echo "..."
if [ ! -d /usr/share/icons/grooveshark ]
then
      mkdir /usr/share/icons/grooveshark
fi

cp grooveshark.png /usr/share/icons/grooveshark

echo "Done."

echo "Setting up desktop file (for application menus etc)"
echo "..."
cp grooveshark.desktop /usr/share/applications/
echo "Done!"
echo ""
echo "Now search for 'grooveshark' in your applications menu (winkey or winkey-A in Unity, or just winkey in GNOME 3)"
