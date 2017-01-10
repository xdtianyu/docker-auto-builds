#!/bin/bash

/usr/sbin/nginx -g 'daemon on; master_process on;'

supervisord -n -c /etc/supervisor/supervisord.conf





