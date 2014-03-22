FROM stackbrew/ubuntu:13.04
RUN mkdir -p /usr/bin/
ADD etcdctl /usr/bin/etcdctl
ADD docker /usr/bin/docker
ADD libdevmapper.so.1.02 /lib/libdevmapper.so.1.02
ADD run.sh /usr/bin/run.sh
ENTRYPOINT ["/usr/bin/run.sh"]
