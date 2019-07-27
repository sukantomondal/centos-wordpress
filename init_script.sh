#!/bin/bash
# centos init script

# mysql start
/sbin/chkconfig --levels 235 mysqld on
service mysqld start

# Appache start
service httpd start

#tail -f /dev/null


sleep 1
/root/set_mysql_root_password.sh $MYSQL_ROOT_PASS

sleep 1
/root/create_database_for_wordpress.sh

sleep 1
/root/configure_wordpress.sh

tail -f /dev/null
