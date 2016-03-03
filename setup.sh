#!/bin/bash

command_exists () {
	command -v "$1" > /dev/null 2>&1
}
fail () {
	echo "$1" >&2; exit 1;
}
info () {
	echo '' && echo "$1" 
}

# Install dependencies
info 'Preparing dependencies...'
if ! command_exists 'pip' && command_exists 'brew'; then
	# Mac with Homebrew - attempt installing pip
	brew install pip	|| fail 'Failed installing pip'
fi

command_exists 'pip'	|| fail 'pip not available - cannot install Flask'
pip install Flask -q	|| fail 'Failed installing Flask'

# Load repository
info 'Loading app...'
curl -L -O 'https://github.com/ecarreras/pdicons/archive/master.zip'	|| fail 'Failed downloading app'
unzip master.zip														|| fail 'Failed unzipping app'
rm -rf master.zip

cd pdicons-master

info 'Enter Noun Project API details (thenounproject.com/developers/apps/)'
read -p 'OAuth Key: ' OAUTH_KEY
read -p 'OAuth Secret: ' OAUTH_SECRET

# Setup API
echo "\
OAUTH_KEY=\""${OAUTH_KEY}"\"
OAUTH_SECRET=\""${OAUTH_SECRET}"\"
" > app.config

# Execute
echo ''
echo '*****************************************'
echo '* Open http://localhost:5000 in browser *'
echo '*****************************************'
echo ''

python app.py
