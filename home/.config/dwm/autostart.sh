#!/bin/bash
# Change to home directory so relative paths work correctly
cd "$HOME"

# Give dwm a moment to start
sleep 1

# Monitor 0 - Tag 1
echo "Launching Joplin..."
joplin &
while ! wmctrl -lx | grep -i "joplin.Joplin"; do sleep 0.1; done
echo "Joplin launched"

echo "Launching KeePassXC..."
keepassxc &
while ! wmctrl -lx | grep -i "keepassxc.KeePassXC"; do sleep 0.1; done
echo "KeePassXC launched"

echo "Launching st-main..."
st -n st-main &
while ! wmctrl -lx | grep "st-main.st-256color"; do sleep 0.1; done
echo "st-main launched"

# Monitor 0 - Tag 2
echo "Launching Spotify..."
spotify &
while ! wmctrl -l | grep -i "spotify"; do sleep 0.1; done
echo "Spotify launched"

echo "Launching Chrome Discord..."
chrome --class=chromium-discord --user-data-dir="$HOME/.chromium/chrome-discord" https://discord.com/channels/@me &
while ! wmctrl -lx | grep -i "chromium-discord"; do sleep 0.1; done
echo "Chrome Discord launched"

# Monitor 0 - Tag 3
echo "Launching st-root..."
st -n st-root -e su - &
while ! wmctrl -lx | grep "st-root.st-256color"; do sleep 0.1; done
echo "st-root launched"

# Monitor 1 - Tag 1
echo "Launching Cursor..."
cursor &
while ! wmctrl -l | grep -i "cursor"; do sleep 0.1; done
echo "Cursor launched"

# Monitor 1 - Tag 2
echo "Launching GIMP..."
gimp &
while ! wmctrl -l | grep -i "gimp"; do sleep 0.1; done
echo "GIMP launched"

# Monitor 1 - Tag 3
echo "Launching Inkscape..."
inkscape --with-gui &
while ! wmctrl -l | grep -i "inkscape"; do sleep 0.1; done
echo "Inkscape launched"

echo "Launching Chrome Docs..."
chrome --class=chromium-docs --user-data-dir="$HOME/.chromium/chrome-docs" &
while ! wmctrl -lx | grep -i "chromium-docs"; do sleep 0.1; done
echo "Chrome Docs launched"

# Monitor 2 - Tag 1
echo "Launching Chrome Main..."
chrome --class=chromium-main --user-data-dir="$HOME/.chromium/chrome-main" &
while ! wmctrl -lx | grep -i "chromium-main"; do sleep 0.1; done
echo "Chrome Main launched"

# Monitor 2 - Tag 2
echo "Launching FileZilla..."
filezilla &
while ! wmctrl -l | grep -i "filezilla"; do sleep 0.1; done
echo "FileZilla launched"

echo "Launching Chrome Secondary..."
chrome --class=chromium-secondary --user-data-dir="$HOME/.chromium/chrome-secondary" &
while ! wmctrl -lx | grep -i "chromium-secondary"; do sleep 0.1; done
echo "Chrome Secondary launched"

# Disown all background jobs so they survive script exit
disown -a

echo "All applications launched!"
