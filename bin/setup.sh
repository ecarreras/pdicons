#!/usr/bin/env bash

command_exists() { command -v "$1" > /dev/null 2>&1; }
log() { printf "%b\n" "$*"; }
fail() { log "\nERROR: $*\n" ; exit 1 ; }

# Install dependencies
log 'Preparing dependencies...'

if ! command_exists 'pip' && command_exists 'brew'; then
    brew install pip || fail 'Failed to install pip'
fi

command_exists 'pip' || fail 'Pip not available, cannot install dependencies'
pip -q install -r requirements.txt || fail 'Failed to install dependencies'

# Download the application
log 'Downloading application...'
curl -L -sS -O 'https://github.com/ecarreras/pdicons/archive/master.zip' || fail 'Failed to download application'
unzip -q master.zip || fail 'Failed to unzip application'
rm -rf master.zip
cd pdicons-master

# Configure API credentials
log '\nEnter Noun Project API details (https://thenounproject.com/developers/apps/)'
read -p 'OAuth Key: ' OAUTH_KEY
read -p 'OAuth Secret: ' OAUTH_SECRET

echo "\
OAUTH_KEY=\""${OAUTH_KEY}"\"
OAUTH_SECRET=\""${OAUTH_SECRET}"\"
" > app.config

# Launch the application
log '\nLaunching application...'
python app.py
