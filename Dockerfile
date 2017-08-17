FROM intelsdi/snap:alpine
MAINTAINER DUONG Dinh Cuong <cuong3ihut@gmail.com>

ENV SNAP_TRUST_LEVEL=0 SNAP_LOG_LEVEL=1

COPY conf/config.json /opt/snap/config.json
COPY plugins /opt/snap/plugins
COPY tasks /opt/snap/tasks

VOLUME /opt/snap/plugins
VOLUME /opt/snap/tasks
VOLUME /opt/snap/files

WORKDIR /opt/snap/

EXPOSE 8181

CMD /usr/local/bin/init_snap && /opt/snap/sbin/snapteld --config /opt/snap/config.json -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
