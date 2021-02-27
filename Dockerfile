FROM ubuntu:18.04
RUN  apt-get update -y
RUN  apt-get install -y software-properties-common
RUN  add-apt-repository ppa:ondrej/php
RUN  add-apt-repository ppa:ondrej/apache2
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 php7.2 php7.2-curl php7.2-mysql php-pear php7.2-dev php7.2-mbstring php7.2-bcmath libssh2-1-dev libpcre3-dev unzip wget php7.2-zip php-ssh2 iputils-ping
RUN  a2enmod ssl
RUN  a2enmod rewrite
#RUN  /bin/sh -c a2enmod header
Run apt-get install php libapache2-mod-php  php-mysql -y
Run rm -r /etc/apache2/sites-enabled/000-default.conf
COPY app.conf /etc/apache2/sites-enabled/
COPY webapp  /var/www/html/app/
EXPOSE 80
#CMD ["apache2ctl","-g","daemon on;"]

CMD apachectl -D FOREGROUND
