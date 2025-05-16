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
