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
COPY default /etc/nginx/sites-available/
COPY index.php /var/www/html/
COPY main.sh /

RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

ENTRYPOINT ["./main.sh"]

EXPOSE 80
