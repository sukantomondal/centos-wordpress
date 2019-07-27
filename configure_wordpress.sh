#!/bin/sh
#Author: Sukanto Mondal

#Download WordPress using the wget command:
#wget http://wordpress.org/latest.zip

#Now we will unzip the WordPress zip file in the /var/www/html/ directory.
unzip -q /root/latest.zip -d /var/www/html/

#Set the proper permissions:
chown -R apache:apache /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

#We need to create the upload directory manually:
mkdir -p /var/www/html/wordpress/wp-content/uploads

#Allow the Apache web server to write to the uploads directory
chown -R :apache /var/www/html/wordpress/wp-content/uploads

#Enter the WordPress directory:
cd /var/www/html/wordpress/

#Rename wp-config-sample.php into wp-config.php:
mv wp-config-sample.php wp-config.php


#change the DB settings
sed -i "s/database_name_here/$WPDB/g" wp-config.php
sed -i "s/username_here/$WPDBUSER/g" wp-config.php
sed -i "s/password_here/$WPDBPASS/g" wp-config.php
