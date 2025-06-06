#!/bin/bash

set -e

echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing required packages..."
sudo apt install -y default-jre flatpak git curl unzip x11-utils unclutter

echo "➕ Adding Flathub repository for Flatpak..."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "🎮 Installing Flatpak apps: PrismLauncher, Steam Link, Pegasus..."
flatpak install -y flathub org.prismlauncher.PrismLauncher
flatpak install -y flathub com.valvesoftware.SteamLink
flatpak install -y flathub org.pegasus_frontend.pegasus

echo "🎨 Installing 'library' theme for Pegasus Frontend..."
THEME_DIR="$HOME/.pegasus-frontend/themes/library"
mkdir -p "$THEME_DIR"
curl -L https://github.com/Fr75s/library/archive/master.zip -o /tmp/library-master.zip
unzip -o /tmp/library-master.zip -d /tmp/
rm -rf "$THEME_DIR"
mv /tmp/library-master "$THEME_DIR"

echo "🛠 Setting Pegasus to use 'library' theme..."
CONFIG_FILE="$HOME/.config/pegasus-frontend/settings.txt"
mkdir -p "$(dirname "$CONFIG_FILE")"
if grep -q "^theme:" "$CONFIG_FILE" 2>/dev/null; then
    sed -i "s/^theme:.*/theme: library/" "$CONFIG_FILE"
else
    echo "theme: library" >> "$CONFIG_FILE"
fi

echo "🖥 Adding autostart entry for Pegasus Frontend (fullscreen, hide mouse)..."
mkdir -p ~/.config/autostart
cat <<EOF > ~/.config/autostart/pegasus.desktop
[Desktop Entry]
Type=Application
Name=Pegasus Frontend
Exec=bash -c 'unclutter -idle 0.5 & flatpak run org.pegasus_frontend.pegasus'
X-GNOME-Autostart-enabled=true
EOF

echo "💡 Disabling screen blanking and power management..."
AUTOSTART_XINITRC="$HOME/.xinitrc"
echo 'xset s off' >> "$AUTOSTART_XINITRC"
echo 'xset -dpms' >> "$AUTOSTART_XINITRC"
echo 'xset s noblank' >> "$AUTOSTART_XINITRC"

echo "🚀 Setting CPU governor to performance for better gaming..."
if [ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ]; then
  echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  sudo apt install -y cpufrequtils
  echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
fi

# Removed auto-login setup as requested

echo ""
echo "✅ Setup complete!"
echo "🔁 Rebooting in 10 seconds..."

for i in {10..1}; do
    echo "$i..."
    sleep 1
done

sudo reboot
