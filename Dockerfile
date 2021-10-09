FROM mariadb:10.6

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y nginx-full \
                       php7.4-fpm php7.4-mysql php7.4-mbstring php7.4-sqlite3 \
                       php7.4-xml php7.4-json php7.4-curl php7.4-bcmath \
                       php7.4-zip php7.4-gd

RUN apt-get install -y less vim-tiny net-tools curl

RUN apt-get clean && rm -fr /var/lib/apt/list/*

COPY www.conf /etc/php/7.4/fpm/pool.d/
COPY php.ini /etc/php/7.4/fpm

RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

EXPOSE 9000

#
#COPY php.ini /etc/php5/apache2/php.ini
#COPY dvwa /var/www/html
#
#COPY config.inc.php /var/www/html/config/
#
#RUN chown www-data:www-data -R /var/www/html && \
#    rm /var/www/html/index.html
#
#RUN service mysql start && \
#    sleep 3 && \
#    mysql -uroot -pvulnerables -e "CREATE USER app@localhost IDENTIFIED BY 'vulnerables';CREATE DATABASE dvwa;GRANT ALL privileges ON dvwa.* TO 'app'@localhost;"
#
#EXPOSE 80
#
#COPY main.sh /
#ENTRYPOINT ["/main.sh"]
