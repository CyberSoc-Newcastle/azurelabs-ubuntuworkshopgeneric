#!/bin/bash
parent_path=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

sudo apt update -y
sudo apt upgrade -y
sudo apt install xrdp -y
sudo apt install gnome-session gdm3 -y
sudo usermod -a -G ssl-cert xrdp
echo "cG9sa2l0LmFkZFJ1bGUoZnVuY3Rpb24oYWN0aW9uLCBzdWJqZWN0KSB7CmlmICgoYWN0aW9uLmlkID09IOKAnG9yZy5mcmVlZGVza3RvcC5jb2xvci1tYW5hZ2VyLmNyZWF0ZS1kZXZpY2XigJ0gfHwgYWN0aW9uLmlkID09IOKAnG9yZy5mcmVlZGVza3RvcC5jb2xvci1tYW5hZ2VyLmNyZWF0ZS1wcm9maWxl4oCdIHx8IGFjdGlvbi5pZCA9PSDigJxvcmcuZnJlZWRlc2t0b3AuY29sb3ItbWFuYWdlci5kZWxldGUtZGV2aWNl4oCdIHx8IGFjdGlvbi5pZCA9PSDigJxvcmcuZnJlZWRlc2t0b3AuY29sb3ItbWFuYWdlci5kZWxldGUtcHJvZmlsZeKAnSB8fCBhY3Rpb24uaWQgPT0g4oCcb3JnLmZyZWVkZXNrdG9wLmNvbG9yLW1hbmFnZXIubW9kaWZ5LWRldmljZeKAnSB8fCBhY3Rpb24uaWQgPT0g4oCcb3JnLmZyZWVkZXNrdG9wLmNvbG9yLW1hbmFnZXIubW9kaWZ5LXByb2ZpbGXigJ0pICYmIHN1YmplY3QuaXNJbkdyb3VwKOKAnHtncm91cH3igJ0pKQp7CnJldHVybiBwb2xraXQuUmVzdWx0LllFUzsKfQp9KTs=" | base64 -d | sudo tee -a /etc/polkit-1/localauthority.conf.d/02-allow-colord.conf
sudo addgroup tsusers
sudo adduser $USER tsusers
sudo adduser $USER xrdp
sudo systemctl restart xrdp

# Useability
# Set GNOME to dark mode
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.wm.preferences theme 'Adwaita-dark'
# Disable screen lock
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0
# Enable auto-login for the current user
sudo mkdir -p /etc/gdm3
echo "[daemon]
AutomaticLoginEnable = true
AutomaticLogin = $USER" | sudo tee /etc/gdm3/custom.conf >/dev/null

# Set CyberSoc Branding
# Desktop Background
mkdir -p ~/Pictures/CyberSoc
cp "$parent_path"/desktop.png ~/Pictures/CyberSoc/desktop.png
gsettings set org.gnome.desktop.background picture-uri-dark file://"$(readlink -f ~/Pictures)"/CyberSoc/desktop.png
gsettings set org.gnome.desktop.background picture-uri file://"$(readlink -f ~/Pictures)"/CyberSoc/desktop.png