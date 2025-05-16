#!/bin/bash

# Update packages
sudo apt update && sudo apt install -y \
  git curl gnupg2 build-essential libreadline-dev libssl-dev \
  libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev \
  zlib1g zlib1g-dev libxml2 libxml2-dev libxslt1-dev ruby-full \
  libyaml-dev openssl autoconf libgmp-dev libgmp10 \
  libcurl4-openssl-dev nmap postgresql postgresql-contrib \
  libapr1 libaprutil1 libsvn1

# Clone Metasploit
git clone https://github.com/rapid7/metasploit-framework.git
cd metasploit-framework

# Install Ruby gems
gem install bundler
bundle install

# Link msfconsole to PATH
echo "alias msfconsole='$(pwd)/msfconsole'" >> ~/.bashrc
source ~/.bashrc

# Test
msfconsole --version


# LET'S MAKE THE SETUP S.T. WE CAN JUST CALL msfconsole REGARDLESS OF CURRENT DIRECTORY # REMO

# Full path to your msfconsole script
MSF_PATH="/workspaces/SSSC_metasploit_integrationTest/metasploit-framework/msfconsole"
SYMLINK_PATH="/usr/local/bin/msfconsole"

# Check if msfconsole exists
if [ ! -f "$MSF_PATH" ]; then
  echo "❌ msfconsole not found at $MSF_PATH"
  exit 1
fi

# Remove old symlink if it exists
if [ -L "$SYMLINK_PATH" ]; then
  sudo rm "$SYMLINK_PATH"
fi

# Create a new symlink
sudo ln -s "$MSF_PATH" "$SYMLINK_PATH"
echo "✅ Symlink created: msfconsole → $MSF_PATH"

# Test it
msfconsole --version



# ------------------------------
# Install RVM and Ruby 3.2.5
# ------------------------------
echo "🔧 Installing RVM and Ruby 3.2.5..."

# Install RVM
\curl -sSL https://get.rvm.io | bash -s stable

# Load RVM into current shell session
source ~/.rvm/scripts/rvm

# Install Ruby 3.2.5 and use it
rvm install "ruby-3.2.5"
rvm use 3.2.5 --default

# Verify Ruby version
ruby -v

# ------------------------------
# Install Metasploit Ruby Gems
# ------------------------------
echo "📦 Installing required gems..."

cd /workspaces/SSSC_metasploit_integrationTest/metasploit-framework

# Install bundler and gems
gem install bundler
bundle install

# Done
echo "✅ Ruby environment ready for Metasploit"
