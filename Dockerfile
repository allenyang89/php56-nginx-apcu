FROM navidonskis/nginx-php5.6

ENV REFRESHED_AT 2020-09-09

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install wget -y \
    && php5dismod apcu \
    && rm -rf /usr/share/doc/php-apc \
    && apt-get purge php5-apcu -y \
    && apt-get update \
    && wget http://launchpadlibrarian.net/195966887/php5-apcu_4.0.7-1build1_amd64.deb \
    && dpkg -i php5-apcu_4.0.7-1build1_amd64.deb \
    && cp /usr/lib/php5/20131226/apcu.so /usr/lib/php/20131226/apcu.so \
    && php5enmod apcu \
    && rm php5-apcu_4.0.7-1build1_amd64.deb \
    && apt-get autoremove -y \
    && apt-get clean -y
