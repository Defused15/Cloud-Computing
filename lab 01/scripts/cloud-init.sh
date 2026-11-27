#!/bin/bash
apt-get update
apt-get install -y apache2 git
rm -rf /var/www/html
git clone https://github.com/cloudacademy/static-website-example.git /var/www/html
systemctl enable --now apache2
