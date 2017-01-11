FROM alpine

RUN apk add --update openssh libwebsockets json-c libssl1.0 supervisor nginx libgcc && \
    rm -rf /tmp/* /var/cache/apk/*

RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd && \
    ln -s /usr/lib/libwebsockets.so.9 /usr/lib/libwebsockets.so.8.1 && \
    rm /etc/nginx/conf.d/default.conf && mkdir /run/nginx && \
    mkdir -p /var/www && \
    mkdir -p /etc/supervisor.d/
    

ADD ttyd/ttyd /usr/sbin

ADD nginx/ttyd.conf /etc/nginx/conf.d
ADD nginx/.htpasswd /etc/nginx/
ADD nginx/index.html /var/www

Add supervisor/ttyd.ini /etc/supervisor.d

ADD entrypoint.sh /usr/sbin

EXPOSE 22 80

ENTRYPOINT ["entrypoint.sh"]

CMD ["/usr/sbin/sshd","-D"]
