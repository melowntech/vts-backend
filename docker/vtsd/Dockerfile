FROM ubuntu:16.04

#LABEL com.vts.version=""
#LABEL com.vts.release-date="2017-08-21"
#LABEL com.vts.version.is-production=""
#LABEL vendor="Melown Technologies"


ARG NAME="vtsd"
ARG DAEMON="/opt/vts/bin/"$NAME
ARG DAEMON_ARGS="-f /etc/vts/vtsd/vtsd.conf --daemonize"
ARG PIDFILE=/var/run/$NAME.pid
ARG CTRL=/var/run/$NAME.ctrl

ENV NAME $NAME
ENV DAEMON $DAEMON
ENV DAEMON_ARGS $DAEMON_ARGS
ENV PIDFILE $PIDFILE
ENV CTRL $CTRL

WORKDIR /vts
RUN useradd -ms /bin/bash -d /vts/ vts 

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update && \
    apt-get -y install software-properties-common apt-transport-https \
    wget && add-apt-repository ppa:ubuntugis/ppa && \
    cd /etc/apt/sources.list.d/ && \
    wget http://cdn.melown.com/packages/conf/melown-xenial.list && \
    wget -O - http://cdn.melown.com/packages/keys/oss.packages%40melown.com.key | apt-key add - && apt-get update && \
    apt-get -y install vts-tools vts-vtsd nginx && apt-get clean
RUN mkdir -p /var/log/vts/

EXPOSE 3060

#USER vts:vts
#CMD echo $NAME
#CMD bash

COPY vts-backend/etc/vtsd /etc/vts/vtsd/

VOLUME ["/var/vts/store"]

ENTRYPOINT $DAEMON "-f" "/etc/vts/vtsd/vtsd.conf"

