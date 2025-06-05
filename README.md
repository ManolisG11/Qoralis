# Qoralis
Pegasus Gaming Setup for Fedora (Raspberry Pi 5)

This script sets up a streamlined gaming environment on **Fedora Linux (GNOME)** for Raspberry Pi 5, featuring:

- **Pegasus Frontend**: A sleek, customizable game launcher  
- **PrismLauncher**: Minecraft Java Edition launcher (Flatpak)  
- **Steam Link**: Stream Steam games from your PC (Flatpak)  
- **Custom "library" theme** for Pegasus Frontend for a modern UI  
- Automatic launch of Pegasus Frontend on GNOME startup  

---

## Features

- Installs required dependencies and Flatpak apps  
- Downloads and installs the popular [library theme](https://github.com/Fr75s/library) for Pegasus  
- Configures Pegasus to use the theme by default  
- Sets Pegasus to auto-start on GNOME login  
- Designed specifically for Fedora and GNOME environments  

---

## Usage

1. Download the script:

   ```bash
   curl -O https://your-url/install-gaming.sh
Make it executable:

bash
Copy
Edit
chmod +x install-gaming.sh
Run the script:

bash
Copy
Edit
./install-gaming.sh
Reboot your system:

bash
Copy
Edit
sudo reboot
On reboot, Pegasus Frontend will launch automatically with the "library" theme, giving you a slick game launcher experience ready to run Minecraft and Steam Link.

Requirements
Fedora Linux with GNOME desktop

Flatpak installed and enabled

Internet connection for downloading packages and theme

Notes
This script uses Fedora's dnf package manager and GNOME autostart features. It may require adjustments for other Linux distributions or desktop environments.

For other distros, replace dnf commands accordingly and update autostart setup to match your DE.

The script installs Flatpak apps from Flathub repository.

Customization
Change the Pegasus theme by modifying the theme folder in ~/.pegasus-frontend/themes and updating the settings.txt file.

Add your game collections and custom launchers to Pegasus by editing files in ~/.pegasus-frontend/collections/.

About Pegasus Frontend
Pegasus Frontend is a versatile, open-source game launcher that supports PC games, emulators, and more with beautiful themes and metadata support.

GitHub: https://github.com/mmatyas/pegasus-frontend

Themes: https://github.com/mmatyas/pegasus-frontend/wiki/Themes

License
This script is released under the MIT License. Feel free to use and modify it for your personal use.

Contributions and Issues
Feel free to open issues or pull requests if you want to suggest improvements or report bugs.

Enjoy your Raspberry Pi 5 gaming setup! 🎮
