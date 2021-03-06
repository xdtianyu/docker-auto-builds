FROM alpine

ENV GOPATH /root/go
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin

ENV PACKAGE github.com/Lafeng/ezgoo

RUN apk add --update bash openssh libwebsockets json-c libssl1.0 supervisor nginx libgcc sudo busybox-suid curl wget tcpdump git go gzip musl-dev && \
    rm -rf /tmp/* /var/cache/apk/* && \
    go get -v $PACKAGE && \
    mv $GOPATH/bin/* /usr/local/bin/ && \
    rm -rf $GOPATH && \
    apk del git go gzip musl-dev

RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "UsePrivilegeSeparation no" >> /etc/ssh/sshd_config && \
    echo "Port 2222" >> /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd && \
    ln -s /usr/lib/libwebsockets.so.9 /usr/lib/libwebsockets.so.8.1 && \
    rm /etc/nginx/conf.d/default.conf && mkdir /run/nginx && \
    mkdir -p /var/www && \
    mkdir -p /var/cache/ggcc && \
    mkdir -p /etc/supervisor.d/

ADD ttyd/ttyd /usr/sbin

ADD nginx/ttyd.conf /etc/nginx/conf.d
ADD nginx/nginx.conf /etc/nginx/
ADD nginx/.htpasswd /etc/nginx/
ADD nginx/index.html /var/www

ADD dist /var/www/dist

ADD supervisor/ttyd.ini /etc/supervisor.d
ADD supervisor/sshd.ini /etc/supervisor.d
ADD supervisor/nginx.ini /etc/supervisor.d
ADD supervisor/ezgoo.ini /etc/supervisor.d

ADD entrypoint.sh /usr/sbin

RUN adduser -D ty && \
    chown -R ty:ty /etc /var/log /var/run /var/local /var/lib /var/cache/ggcc /run /usr && \
    echo "ty:ty" | chpasswd && \
    chmod -R 777 /var/lib

USER ty

EXPOSE 2222 8080

#ENTRYPOINT ["entrypoint.sh"]

CMD ["entrypoint.sh"]
