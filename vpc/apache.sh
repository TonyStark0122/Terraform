#!/bin/bash

sudo apt update
sudo apt install apache
echo "Hi Ms Pepper Stark, How is Tony" >> /var/lib/www/html/index.html
sudo systemctl start apache