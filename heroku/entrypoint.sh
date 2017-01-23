#!/bin/sh

if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
    # generate fresh rsa key
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
fi
if [ ! -f "/etc/ssh/ssh_host_dsa_key" ]; then
    # generate fresh dsa key
    ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
fi

#prepare run dir
if [ ! -d "/var/run/sshd" ]; then
  mkdir -p /var/run/sshd
fi

sed -i "s/8080/$PORT/g" /etc/nginx/conf.d/ttyd.conf

/usr/sbin/nginx -g 'daemon on; master_process on;'

supervisord -c /etc/supervisord.conf

exec "$@"

tail -f /var/log/supervisord.log
