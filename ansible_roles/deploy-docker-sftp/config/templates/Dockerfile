FROM ubuntu:14.04

RUN apt-get update && apt-get install -y acl openssh-server
RUN mkdir /var/run/sshd; \
	mkdir /srv/sftp; \
	chmod 755 /srv/sftp
ADD ./configs/sshd_config /opt/sshd_config
ADD ./configs/sftp.sh /opt/sftp.sh

VOLUME /etc/ssh
VOLUME /srv/sftp

EXPOSE {{ item.0.port }}
EXPOSE 22

CMD ["/opt/sftp.sh"]
