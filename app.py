from os import environ

from flask import Flask, render_template, request
import requests
from requests_oauthlib import OAuth1

app = Flask(__name__)
app.config.setdefault('OAUTH_KEY', environ.get('TNP_OAUTH_KEY'))
app.config.setdefault('OAUTH_SECRET', environ.get('TNP_OAUTH_SECRET'))
try:
    app.config.from_pyfile('app.config')
except IOError:
    app.logger.warning('Config file not found.')


@app.route('/')
def index():
    term = request.args.get('q')
    icons = []
    if term:
        auth = OAuth1(
            app.config['OAUTH_KEY'],
            client_secret=app.config['OAUTH_SECRET']
        )
        url = "http://api.thenounproject.com/icons/{0}?limit_to_public_domain=1".format(term)
        response = requests.get(url, auth=auth)
        if response.ok:
            icons = response.json().get('icons', [])
    else:
        term=''
    return render_template('index.html', icons=icons, query=term)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(environ.get('PORT', 5000)), debug=True)
