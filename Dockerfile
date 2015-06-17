FROM ubuntu:14.04

ENV INFLUXDB_VERSION 0.9.0
ENV GRAFANA_VERSION 2.0.2

ADD nginx.repo /etc/yum.repos.d/nginx.repo
RUN apt-get -yqq update && apt-get -yqq upgrade
RUN apt-get -yqq install tar wget python python-setuptools curl adduser

RUN wget http://s3.amazonaws.com/influxdb/influxdb_${INFLUX_VERSION}_amd64.deb -O influxdb.deb && \
        dpkg -i influxdb.deb
RUN rm influxdb.deb
RUN wget http://s3.amazonaws.com/grafanarel/grafana_${GRAFANA_VERSION}_amd64.deb -O grafana.deb && \
        dpkg -i grafana.deb
RUN rm grafana.deb

ADD grafana/config.js /opt/grafana/config.js
ADD influxdb/run.sh  /usr/local/bin/run_influxdb
RUN chmod a+x /usr/local/bin/run_influxdb

RUN easy_install supervisor
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
