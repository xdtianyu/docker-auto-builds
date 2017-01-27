#!/bin/sh

echo "default:x:$(id -u):$(id -g):Default Application User:${HOME}:/sbin/nologin" >> /etc/passwd

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

if [ ! -z "$PORT" ]; then
    sed -i "s/8080/$PORT/g" /etc/nginx/conf.d/ttyd.conf
fi

if [ ! -z "$SS_PORT" ]; then
    sed -i "s/58080/$SS_PORT/g" /etc/shadowsocks.json
fi

if [ ! -z "$SS_PASS" ]; then
    sed -i "s/HqsHUPUfmnHYLJ9oIW/$SS_PASS/g" /etc/shadowsocks.json
fi

supervisord -c /etc/supervisord.conf

exec "$@"

tail -f /var/log/supervisord.log
