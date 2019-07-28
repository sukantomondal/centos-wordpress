# centos-wordpress

Define the directories:


define('WP_HOME','https://sukantomondal.ca/wordpress');
define('WP_SITEURL','https://sukantomondal.ca/wordpress');
define('FORCE_SSL_ADMIN', true);
$_SERVER['HTTPS']='on';



Sample RUN: 

docker run -itd --rm --name pkm-wordpress-site -p 8000:80 --env WPHOME_DIR=pkblog sukantomondal/centos-wordpress




In the WPHOME Directory  add the .htaccess file to

RewriteEngine On
DirectoryIndex index.html index.php


