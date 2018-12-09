#!/usr/bin/env bash

docker build -t rafaelgil83/php5.6-apache:HTMLPurifier .

say "image built"


docker run --rm \
    -e "APACHE_DOCUMENT_ROOT=/var/www/dealer-site/porscheownersmanuals" \
    -v /Users/rafag/Documents/projects/web/gstock/dealer-site:/var/www/dealer-site \
    -v /Users/rafag/Documents/projects/web/gstock/persistent:/var/www/persistent \
    -p 80:80 \
    rafaelgil83/php5.6-apache:HTMLPurifier