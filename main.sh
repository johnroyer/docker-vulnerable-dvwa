#!/bin/env bash

echo "Starting MariaDB ...."
service mysql start

echo "Starting PHP7.4-fpm ...."
service php7.4-fpm start

echo "Starting Nginx ...."
service nginx start

tail -f /var/log/nginx/access.log
