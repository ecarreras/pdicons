from flask import Flask, render_template, request
import requests
from requests_oauthlib import OAuth1

app = Flask(__name__)
app.config.from_pyfile('app.config')


@app.route('/')
def index():
    term = request.args.get('term')
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
    return render_template('index.html', icons=icons)


if __name__ == '__main__':
    app.run(debug=True)
