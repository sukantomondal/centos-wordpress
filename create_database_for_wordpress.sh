#! /bin/sh

is_mysql_root_password_set() {
  ! mysqladmin --user=root status > /dev/null 2>&1
}
USER="wpuser"
PASSWD="!wp!user!"
MAINDB="wordpress"
TABLENAME="ufo_sightings_bookeeper"

#Creating database user

if is_mysql_root_password_set; then
mysql -u root -p${MYSQL_ROOT_PASS}  << EOF
CREATE DATABASE ${WPDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER ${WPDBUSER}@localhost IDENTIFIED BY '${WPDBPASS}';
GRANT ALL PRIVILEGES ON ${WPDB}.* TO '${WPDBUSER}'@'localhost';
FLUSH PRIVILEGES;
EOF
else
  echo "Database root password is not set"
  exit 0
fi
