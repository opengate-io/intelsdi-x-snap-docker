FROM intelsdi/snap:alpine
MAINTAINER DUONG Dinh Cuong <cuong3ihut@gmail.com>

ENV SNAP_TRUST_LEVEL=0 SNAP_LOG_LEVEL=1

COPY plugins /opt/snap/plugins
COPY tasks /opt/snap/tasks
WORKDIR /opt/snap/

EXPOSE 8181

CMD /usr/local/bin/init_snap && /opt/snap/sbin/snapteld -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
