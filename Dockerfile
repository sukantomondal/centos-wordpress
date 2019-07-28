#Author: Sukanto Mondal
#A basic centos6 server docker image

FROM centos:6
ENV container docker
ADD init_script.sh /root/init_script.sh
ADD set_mysql_root_password.sh /root/set_mysql_root_password.sh
ADD create_database_for_wordpress.sh /root/create_database_for_wordpress.sh
ADD configure_wordpress.sh /root/configure_wordpress.sh
ADD latest.zip /root/latest.zip


ENV MYSQL_ROOT_PASS=root123 WPDB=wordpress WPDBUSER=wpuser WPDBPASS=!wp!user! WPHOME_DIR=wordpress  

RUN ["chmod", "+x", "/root/set_mysql_root_password.sh"]
RUN ["chmod", "+x", "/root/create_database_for_wordpress.sh"]
RUN ["chmod", "+x", "/root/configure_wordpress.sh"]


RUN yum -y install wget unzip
RUN yum -y install httpd
RUN yum -y install mysql-server

#Installing php7
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-6.rpm
  
RUN yum -y install yum-utils
  
RUN yum-config-manager --enable remi-php70   [Install PHP 7.0]
  
RUN yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo 
  
EXPOSE 80
EXPOSE 8080

CMD sh /root/init_script.sh
