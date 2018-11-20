# PHP 5.6 with apache

Small docker container based on the official php image with apache.

## Content:
- php 5.6
- apache 2.4
- apache rewrite mod enabled
- xdebug 2.5.5
- mysql mod enabled

* Tested on mac

## Usage

Development settings are used by default, do not use for production unless modified.
Default document root /var/www/html, the optional env var can change it.

docker run --rm --name=php56 \\  
    -e "APACHE_DOCUMENT_ROOT=/new/doc/root" \\  
    -v /project/folder:/new/doc/root \\  
    -p 80:80 \\  
    rafaelgil83/php5.6-apache:latest