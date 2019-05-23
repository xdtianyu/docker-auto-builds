FROM shadowsocks/shadowsocks-libev

USER root

RUN apk add --update bash openssh ttyd supervisor nginx libgcc sudo busybox-suid curl wget apache2 apache2-utils apache2-proxy apache2-ctl && \
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

ADD apache/ttyd.conf /etc/apache2/conf.d
ADD nginx/ttyd.conf /etc/nginx/conf.d
ADD nginx/nginx.conf /etc/nginx/
ADD nginx/.htpasswd /etc/nginx/
ADD nginx/index.html /var/www

ADD entrypoint.sh /usr/sbin

ADD https://github.com/jpillora/chisel/releases/download/1.3.1/chisel_linux_amd64.gz /chisel_linux_amd64.gz

RUN gunzip -c chisel_linux_amd64.gz > /bin/chisel && \
    chmod +x /bin/chisel && \
    rm chisel_linux_amd64.gz

ADD https://github.com/v2ray/v2ray-core/releases/download/v4.18.0/v2ray-linux-64.zip /v2ray-linux-64.zip

RUN mkdir -p /etc/v2ray && \
    unzip /v2ray-linux-64.zip -d /etc/v2ray/ -x "systemd/*" -x "systemv/*" -x "doc/*" -x "*.sig" && \
    mv /etc/v2ray/v2ray /bin/ && \
    mv /etc/v2ray/v2ctl /bin/ && \
    chmod +x /bin/v2ray /bin/v2ctl && \
    rm /v2ray-linux-64.zip

COPY v2ray/config.json /etc/v2ray/config.json

COPY ss/v2ray-plugin /bin/v2ray-plugin

ADD supervisor/ss.ini /etc/supervisor.d
ADD supervisor/v2ray.ini /etc/supervisor.d
ADD supervisor/chisel.ini /etc/supervisor.d
ADD supervisor/ttyd.ini /etc/supervisor.d
ADD supervisor/sshd.ini /etc/supervisor.d


RUN adduser -D ty && \
    chown -R ty:ty /etc /var/log /var/run /var/local /var/lib /run /usr && \
    echo "ty:ty" | chpasswd && \
    rm -r /var/log/apache2 && mkdir /var/log/apache2 && \
    chmod -R 777 /var/lib /var/www /var/log


#USER ty

EXPOSE 2222 8080

ENV RAY_ID c191cf0b-f885-489c-872b-3e2285c8bc15
ENV RAY_PATH v2ray
ENV SS_PASS aYHElPyoG8e2H5ZllR
ENV SS_PATH ss
ENV PORT 8080

#ENTRYPOINT ["entrypoint.sh"]

CMD ["entrypoint.sh"]
