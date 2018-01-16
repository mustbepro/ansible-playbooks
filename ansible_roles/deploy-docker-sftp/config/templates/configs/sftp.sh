#!/bin/bash
#create user, setup directory and permissions
#if [ ! -d /srv/sftp/{{ item.0.user }} ]; then
	mkdir -p /srv/sftp/{{ item.0.user }}/
	useradd --shell /bin/bash --home-dir /sftp/{{ item.0.user }}/ -p '{{ item.0.shadow }}' -u {{ item.0.id }} --no-create-home {{ item.0.user }}
	chown {{ item.0.user }} /srv/sftp/{{ item.0.user }}/
#fi
#install SSHd
if [ ! -f /etc/ssh/sshd_config ]; then
	apt update && apt install openssh-server -y
	dpkg-reconfigure openssh-server
	mv /opt/sshd_config /etc/ssh/sshd_config
fi
#start SSHd
exec /usr/sbin/sshd -D -e
