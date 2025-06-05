# Qoralis  
*Pegasus Gaming Setup for Fedora (Raspberry Pi 5)*

---

Qoralis is a streamlined **gaming environment setup script** for **Fedora Linux (GNOME)** on Raspberry Pi 5, designed to quickly install and configure:

- **Pegasus Frontend** — a sleek, customizable game launcher  
- **PrismLauncher** — Minecraft Java Edition launcher via Flatpak  
- **Steam Link** — stream Steam games from your PC (Flatpak)  
- A **custom "library" theme** for Pegasus Frontend, providing a modern and polished UI  
- Automatic launch of Pegasus Frontend on GNOME startup for instant access

---

## ✨ Features

- Installs all necessary dependencies and Flatpak applications  
- Downloads and applies the popular [library theme](https://github.com/Fr75s/library) for Pegasus Frontend  
- Automatically configures Pegasus to use the custom theme  
- Enables Pegasus to start automatically upon GNOME login  
- Tailored specifically for Fedora Linux running GNOME on Raspberry Pi 5

---

## 🚀 Usage

1. **Download the setup script:**
   ```bash
   curl -O https://raw.githubusercontent.com/ManolisG11/Qoralis/refs/heads/main/setup.sh
````

2. **Make it executable:**

   ```bash
   chmod +x setup.sh
   ```

3. **Run the script:**

   ```bash
   ./setup.sh
   ```

4. **Reboot your system:**

   ```bash
   sudo reboot
   ```

After reboot, Pegasus Frontend will launch automatically with the stylish **library** theme — ready for your Minecraft and Steam Link games!

---

## 🖥️ Requirements

* Fedora Linux with GNOME desktop environment
* Flatpak installed and enabled
* Active internet connection for downloads

---

## ⚙️ Notes

* This script uses Fedora’s `dnf` package manager and GNOME autostart system.
* For other Linux distributions, replace `dnf` commands with your distro’s package manager and adjust autostart accordingly.
* The script installs Flatpak applications from the Flathub repository.

---

## 🔧 Customization

* To change the Pegasus theme, modify or replace the contents of `~/.pegasus-frontend/themes/` and update `settings.txt` accordingly.
* Add or organize your game collections and custom launchers under `~/.pegasus-frontend/collections/` for personalized game management.

---

## 📚 About Pegasus Frontend

Pegasus Frontend is an open-source, flexible game launcher supporting PC games, emulators, and more — all wrapped in beautiful themes with rich metadata support.

* [Pegasus Frontend GitHub](https://github.com/mmatyas/pegasus-frontend)
* [Available Themes](https://github.com/mmatyas/pegasus-frontend/wiki/Themes)

---

## 📝 License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it for personal or educational purposes.

---

## 🤝 Contributions & Issues

Contributions, feedback, and bug reports are warmly welcome! Open an issue or submit a pull request to improve Qoralis.

🎮 *Enjoy your Raspberry Pi 5 gaming experience with Qoralis!*
