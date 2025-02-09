FROM ubuntu:20.04

RUN apt-get update

ENV HOME /root
ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get install -y apt-utils dialog
RUN apt-get install -y less vim-tiny nano

RUN apt-get install -y nginx-full \
                       php7.4-fpm php7.4-mysql php7.4-mbstring \
                       php7.4-xml php7.4-json php7.4-bcmath \
                       php7.4-zip php7.4-gd

RUN apt-get install -y mysql-server-8.0



RUN apt-get clean && rm -fr /var/lib/apt/list/*

COPY www.conf /etc/php/7.4/fpm/pool.d/
COPY php.ini /etc/php/7.4/fpm
COPY default /etc/nginx/sites-available/
COPY main.sh /root/

RUN rm -fr /var/www/
COPY --chown=root:root DVWA /var/www/html
RUN chmod -R 777 /var/www/html/hackable/uploads/ \
                 /var/www/html/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt \
                 /var/www/html/config


ENTRYPOINT ["/root/main.sh"]

EXPOSE 80
