#!/bin/bash

set -e

echo "Updating system..."
sudo dnf update -y

echo "Installing required packages..."
sudo dnf install java-17-openjdk flatpak git curl unzip -y

echo "Adding Flathub repository for Flatpak..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing PrismLauncher (Minecraft Java Edition)..."
flatpak install -y flathub org.prismlauncher.PrismLauncher

echo "Installing Steam Link..."
flatpak install -y flathub com.valvesoftware.SteamLink

echo "Installing Pegasus Frontend..."
flatpak install -y flathub org.pegasus_frontend.pegasus

echo "Downloading and installing the 'library' theme for Pegasus Frontend..."
THEME_DIR="$HOME/.pegasus-frontend/themes/library"
mkdir -p "$THEME_DIR"
curl -L https://github.com/Fr75s/library/archive/master.zip -o /tmp/library-master.zip
unzip -o /tmp/library-master.zip -d /tmp/
rm -rf "$THEME_DIR"
mv /tmp/library-master "$THEME_DIR"

echo "Setting Pegasus theme to 'library'..."
CONFIG_FILE="$HOME/.config/pegasus-frontend/settings.txt"
mkdir -p "$(dirname "$CONFIG_FILE")"
# Write or replace theme setting
if grep -q "^theme:" "$CONFIG_FILE" 2>/dev/null; then
    sed -i "s/^theme:.*/theme: library/" "$CONFIG_FILE"
else
    echo "theme: library" >> "$CONFIG_FILE"
fi

echo "Creating autostart entry for Pegasus Frontend..."
mkdir -p ~/.config/autostart
cat <<EOF > ~/.config/autostart/pegasus.desktop
[Desktop Entry]
Type=Application
Name=Pegasus Frontend
Exec=flatpak run org.pegasus_frontend.pegasus
X-GNOME-Autostart-enabled=true
EOF

echo "Setup complete! Reboot your system to start Pegasus Frontend with the 'library' theme automatically."
