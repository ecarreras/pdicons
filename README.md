The Noun Project Public Domain Icons
====================================

Search for public domain licensed icons on [The Noun Project](https://thenounproject.com/).


Setup
-----

1. Download and unzip the repository, and install [Flask](http://flask.pocoo.org) using `pip` (one-liner install on a Mac with Homebrew: `curl -L -O "https://github.com/ecarreras/pdicons/archive/master.zip" && unzip master.zip -d pdicons && brew install pip && pip install Flask`)

2. Register for The Noun Project API access by [creating a new app](http://thenounproject.com/developers/apps/).

3. Copy `app.config.example` to `app.config`, and enter the OAuth Key and OAuth Secret fields from The Noun Project website.

4. Launch the application with `python app.py` and browse to http://localhost:5000
