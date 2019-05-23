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
sed -i "s/PORT/$PORT/g" /etc/apache2/conf.d/ttyd.conf
sed -i "/Listen\ 80/d" /etc/apache2/httpd.conf

USER=$(id -u -n)
GROUP=$(id -g -n)

if [ $USER == "root" ]; then
    USER="apache"
    GROUP="apache"
fi

sed -i "s/User\ apache/User\ $USER/g" /etc/apache2/httpd.conf
sed -i "s/Group\ apache/Group\ $GROUP/g" /etc/apache2/httpd.conf

sed -i "s/RAY_PATH/$RAY_PATH/g" /etc/v2ray/config.json
sed -i "s/RAY_ID/$RAY_ID/g" /etc/v2ray/config.json
sed -i "s/RAY_PATH/$RAY_PATH/g" /etc/nginx/conf.d/ttyd.conf
sed -i "s/RAY_PATH/$RAY_PATH/g" /etc/apache2/conf.d/ttyd.conf

sed -i "s/SS_PATH/$SS_PATH/g" /etc/supervisor.d/ss.ini
sed -i "s/SS_PASS/$SS_PASS/g" /etc/supervisor.d/ss.ini
sed -i "s/SS_PATH/$SS_PATH/g" /etc/nginx/conf.d/ttyd.conf
sed -i "s/SS_PATH/$SS_PATH/g" /etc/apache2/conf.d/ttyd.conf


rm /etc/nginx/conf.d/default.conf

if [ -z "$APACHE" ]; then
    /usr/sbin/nginx -g 'daemon on; master_process on;'
else
    apachectl start
fi

supervisord -c /etc/supervisord.conf

exec "$@"

tail -f /var/log/supervisord.log
