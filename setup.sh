#!/bin/bash

# Update system
sudo apt update

# Install curl if not present
sudo apt install -y curl

# Download and install Metasploit via Rapid7 installer
curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfinstall > msfinstall
chmod +x msfinstall
sudo ./msfinstall

# Confirm installation
msfconsole --version
