FROM shadowsocks/shadowsocks-libev

USER root

RUN apk add --update bash openssh ttyd supervisor nginx libgcc sudo busybox-suid curl wget && \
    rm -rf /tmp/* /var/cache/apk/*

RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "UsePrivilegeSeparation no" >> /etc/ssh/sshd_config && \
    echo "Port 2222" >> /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd && \
    ln -s /usr/lib/libwebsockets.so.9 /usr/lib/libwebsockets.so.8.1 && \
    rm /etc/nginx/conf.d/default.conf && mkdir /run/nginx && \
    mkdir -p /var/www && \
    mkdir -p /etc/supervisor.d/

ADD nginx/ttyd.conf /etc/nginx/conf.d
ADD nginx/nginx.conf /etc/nginx/
ADD nginx/.htpasswd /etc/nginx/
ADD nginx/index.html /var/www

Add supervisor/ttyd.ini /etc/supervisor.d
Add supervisor/sshd.ini /etc/supervisor.d

ADD entrypoint.sh /usr/sbin

RUN adduser -D ty && \
    chown -R ty:ty /etc /var/log /var/run /var/local /var/lib /run /usr && \
    echo "ty:ty" | chpasswd && \
    chmod -R 777 /var/lib

ADD https://github.com/v2ray/v2ray-core/releases/download/v4.18.0/v2ray-linux-64.zip /v2ray-linux-64.zip

RUN mkdir -p /etc/v2ray && \
    unzip /v2ray-linux-64.zip -d /etc/v2ray/ -x "systemd/*" -x "systemv/*" -x "doc/*" -x "*.sig" && \
    mv /etc/v2ray/v2ray /bin/ && \
    mv /etc/v2ray/v2ctl /bin/ && \
    chmod +x /bin/v2ray /bin/v2ctl && \
    rm /v2ray-linux-64.zip

COPY v2ray/config.json /etc/v2ray/config.json

COPY ss/v2ray-plugin /bin/v2ray-plugin

Add supervisor/ss.ini /etc/supervisor.d
Add supervisor/v2ray.ini /etc/supervisor.d

USER ty

EXPOSE 2222 8080

ENV V2RAY_ID c191cf0b-f885-489c-872b-3e2285c8bc15
ENV V2RAY_PATH vray

#ENTRYPOINT ["entrypoint.sh"]

CMD ["entrypoint.sh"]
