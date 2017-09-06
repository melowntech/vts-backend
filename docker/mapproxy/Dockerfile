FROM ubuntu:16.04

#LABEL com.vts.version=""
#LABEL com.vts.release-date="2017-08-21"
#LABEL com.vts.version.is-production=""
#LABEL vendor="Melown Technologies"


ARG NAME="mapproxy"
ARG DAEMON="/opt/vts/bin/"$NAME
ARG PIDFILE=/var/run/$NAME.pid
ARG CTRL=/var/run/$NAME.ctrl

ENV NAME $NAME
ENV DAEMON $DAEMON
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
    apt-get -y install vts-tools vts-mapproxy && apt-get clean

VOLUME ["/vts/datasets"]

RUN mkdir -p /etc/vts/mapproxy/examples.d
RUN mkdir -p /var/vts/mapproxy/datasets
RUN mkdir -p /vts/datasets/
COPY docker/mapproxy/resources.json /var/vts/mapproxy/
COPY docker/mapproxy/egm96_15.gtx /usr/share/proj/
RUN ln -s /var/vts/mapproxy/resources.json /etc/vts/mapproxy/resources.json

COPY docker/mapproxy/fix_paths.sh /tmp/

EXPOSE 3070


ADD vts-backend/debian/vts-backend/etc/vts/mapproxy/examples.d/ /etc/vts/mapproxy/examples.d
ADD vts-backend/datasets/examples /var/vts/mapproxy/datasets/
COPY docker/mapproxy/mapproxy.conf /etc/vts/mapproxy/mapproxy.conf

RUN sh /tmp/fix_paths.sh
RUN chown -R vts:vts /var/vts

#USER vts:vts

#ENTRYPOINT /bin/bash
ENTRYPOINT $DAEMON "--config" "/etc/vts/mapproxy/mapproxy.conf"

