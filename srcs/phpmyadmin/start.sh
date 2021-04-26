#!/bin/bash

# php-fpm7 -R && /usr/sbin/nginx -g "daemon off;"
php-fpm7 && nginx -g "daemon off;"
# php-fpm7