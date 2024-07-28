#!/bin/bash

# Update repositories and add architectures
sudo add-apt-repository multiverse -y
sudo dpkg --add-architecture i386
sudo apt-get update -y

# Install required packages
sudo apt-get install software-properties-common steamcmd -y

# Add non-free repository
sudo apt-add-repository non-free -y

# Create user and set up directory
sudo adduser --disabled-password --gecos "" pzuser
sudo mkdir -p /opt/pzserver
sudo chown pzuser:pzuser /opt/pzserver

# Create update script
sudo -u pzuser bash -c "cat > /home/pzuser/update_zomboid.txt << EOL
@ShutdownOnFailedCommand 1
@NoPromptForPassword 1
force_install_dir /opt/pzserver/
login anonymous
app_update 380870 validate
quit
EOL"

# Run SteamCMD to update/install the server
sudo -u pzuser bash -c "export PATH=\$PATH:/usr/games && steamcmd +runscript /home/pzuser/update_zomboid.txt"

# Create zomboid-server script
sudo tee /usr/bin/zomboid-server > /dev/null << EOL
#!/bin/bash
# Update the server
sudo -u pzuser bash -c "export PATH=\$PATH:/usr/games && steamcmd +runscript /home/pzuser/update_zomboid.txt"

# Run the server
sudo -u pzuser bash -c "cd /opt/pzserver && ./start-server.sh"
EOL

# Make the script executable
sudo chmod +x /usr/bin/zomboid-server


# Configure firewall
sudo ufw allow 16261/udp
sudo ufw allow 16262/udp
sudo ufw reload

echo "Installation and setup of Zomboid dedicated server is complete!"
echo "You can now run the server by typing 'zomboid-server' in the terminal'
