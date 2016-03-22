The Noun Project Public Domain Icons
====================================

Search for public domain licensed icons on [The Noun Project](https://thenounproject.com/).


Quick Setup
-----------

```bash
bash <(curl -s "https://cdn.rawgit.com/ecarreras/pdicons/master/bin/setup.sh")
```

Either [Homebrew](http://brew.sh) or [Pip](https://en.wikipedia.org/wiki/Pip_(package_manager)) must be installed.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/ecarreras/pdicons)


Setup
-----

1. Register for The Noun Project API access by [creating a new app](http://thenounproject.com/developers/apps/)

2. Download and unzip the repository, and install dependencies using `pip install -r requirements.txt`

3. Copy `app.config.example` to `app.config`, and populate the OAuth Key and OAuth Secret with your The Noun Project app keys

4. Launch the application with `python app.py` and browse to http://localhost:5000
