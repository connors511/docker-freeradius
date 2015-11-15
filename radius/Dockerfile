FROM ubuntu

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# RUN	cd /opt/ && tar -zxf freeradius.tgz && ldconfig && \
# 	mv -f radiusd.conf freeradius/etc/raddb/ && \
# 	mv -f default freeradius/etc/raddb/sites-available/ && \
# 	rm -f freeradius.tgz
	
# RUN mv -f /opt/sql.conf /opt/freeradius/etc/raddb/sql.conf

RUN apt-get update && \
	apt-get install -y php5-common php5-gd php-pear php-db libapache2-mod-php5 php-mail mysql-client && \
	apt-get install -y freeradius freeradius-mysql freeradius-utils

RUN sed -i 's/#[[:space:]]*$INCLUDE sql.conf/$INCLUDE sql.conf/' /etc/freeradius/radiusd.conf

RUN sed -i 's/#readclients/readclients/' /etc/freeradius/sql.conf
RUN sed -i 's/server = "localhost"/server = "mysql"/' /etc/freeradius/sql.conf
RUN sed -i 's/#[[:space:]]*sql\n/sql/g' /etc/freeradius/sites-enabled/default

EXPOSE 1812 1813

ADD files/ /
RUN chmod +x /init.sh

CMD ["/init.sh"]