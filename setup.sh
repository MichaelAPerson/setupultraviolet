#!/bin/bash

set -e

# Make sure script is executable (safe if already is)
chmod +x "$0"

echo "== Updating system =="
sudo apt update -y

echo "== Installing dependencies =="
sudo apt install -y git nodejs npm

echo "== Checking Node version =="
node -v || echo "Node installed"
npm -v || echo "NPM installed"

echo "== Cloning Ultraviolet =="
if [ ! -d "Ultraviolet" ]; then
  git clone https://github.com/titaniumnetwork-dev/Ultraviolet.git
else
  echo "Ultraviolet already exists, skipping clone"
fi

cd Ultraviolet

echo "== Installing packages =="
npm install

echo "== Starting server =="
if [ -f "server.js" ]; then
  node server.js
elif [ -f "index.js" ]; then
  node index.js
else
  npm start
fi
