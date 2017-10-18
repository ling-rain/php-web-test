# php-web-test
A php webpage for test

Base docker image to run PHP applications on Apache

Building the base image

To create the base image rain/php-web-test, execute the following commandr:

docker build -t rain/php-web-test:latest .
Running your Apache+PHP docker image

Start your image binding the external ports 80 in all interfaces to your container:

docker run -d -p 80:80 rain/php-web-test
Test your deployment:

curl http://localhost/
Hello world!

Enable .htaccess files

If you app uses .htaccess files you need to pass the ALLOW_OVERRIDE environment variable

docker run -d -p 80:80 -e ALLOW_OVERRIDE=true rain/php-web-test

Loading your custom PHP application with composer requirements

Create a Dockerfile like the following:

FROM rain/php-web-test
RUN apt-get update && apt-get install -yq git && rm -rf /var/lib/apt/lists/*
RUN rm -fr /app
ADD . /app
RUN composer install
Replacing git with any dependencies that your composer packages might need.
Add your php application to /app
