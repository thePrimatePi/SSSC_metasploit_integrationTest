#!/bin/bash

# Update and install Metasploit
sudo apt update
sudo apt install -y metasploit-framework

# (Optional) Install other tools
# sudo apt install -y nmap python3-pip

# Confirm installation
msfconsole --version
