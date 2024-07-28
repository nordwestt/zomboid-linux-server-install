# 🧟 Project Zomboid Linux Server Installer

This script automates the installation and setup of a dedicated server for Project Zomboid, the popular multiplayer zombie survival game.

## Features

- Automatic installation of all required dependencies
- Creation of a dedicated user for running the server
- Installation and configuration of SteamCMD
- Easy server updates and launching via a single command
- Automatic firewall configuration

## Prerequisites

- A Linux system (tested on Ubuntu/Debian)
- Sudo privileges

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/project-zomboid-server-installer.git
   ```

2. Navigate to the directory:
   ```
   cd project-zomboid-server-installer
   ```

3. Make the script executable:
   ```
   chmod +x install_pz_server.sh
   ```

4. Run the installation script:
   ```
   sudo ./install_pz_server.sh
   ```

## Usage

After installation, you can start or update the server by simply running:
```
zomboid-server
```

This command will automatically update the server to the latest version and then start it.

## Configuration

The server configuration files can be found in `/opt/pzserver/`. You may want to edit these files to customize your server settings.

## Troubleshooting

If you encounter any issues, please check the following:

1. Ensure all prerequisites are met
2. Verify that the installation script completed without errors
3. Check the Project Zomboid server logs for any error messages

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the GNU General Public License

## Acknowledgments

- [PZwiki](https://pzwiki.net/wiki/Dedicated_server) for their in-depth guide on setting up zomboid server for Linux and Windows
- The Project Zomboid development team for creating an amazing game
- The SteamCMD team for their command-line tool

## Disclaimer

This project is not affiliated with or endorsed by The Indie Stone or the Project Zomboid development team.

