all: php

php:
	docker build -t hub.hcpaas.com/rain/php-web-test:latest .
