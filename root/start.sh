#!/bin/bash

usermod -u ${PUID:-1000} www-data
groupmod -g ${PGID:-1000} www-data
chmod -R www-data:www-data /var/www/html/_h5ai
apache2-foreground
