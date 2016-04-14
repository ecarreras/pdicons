FROM alpine:3.3

# Install python and pip
RUN apk add --update py-pip

# Make dir
RUN mkdir -p /usr/src/app/

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/
COPY app.config /usr/src/app
COPY templates/index.html /usr/src/app/templates/
COPY static/script.js /usr/src/app/static/
COPY static/stylesheet.css /usr/src/app/static/

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "/usr/src/app/app.py"]
