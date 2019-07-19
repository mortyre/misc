FROM amazonlinux:1
RUN yum install -y collectd
#ADD collectd.conf collectd.conf
ENTRYPOINT ["collectd", "-f", "-C", "collectd.conf"]
