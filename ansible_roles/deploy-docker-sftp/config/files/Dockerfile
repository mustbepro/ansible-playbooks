FROM ubuntu:14.04

RUN apt-get update && apt-get install -y acl
RUN mkdir /var/run/sshd
ADD ./configs/sshd_config /opt/sshd_config
ADD ./configs/sftp.sh /opt/sftp.sh

VOLUME /etc/ssh
VOLUME /srv/sftp

EXPOSE {{ item.port }}
EXPOSE 22

CMD ["/opt/sftp.sh"]
