## docker chisel

A docker image which runs [chisel](https://github.com/jpillora/chisel) and squid.

## Run on heroku

```shell
heroku container:push web --app YOUR_APP_NAME
```

## chisel client

```shell
chisel client -v https://YOUR_APP_NAME.herokuapp.com/chisel 3128
```

And goto chrome SwitchyOmega settings, add a `http` proxy `127.0.0.1` `port` `3128`. Then you can try some blocked sites.



## Run in background

```shell
docker run -it -p 2222:2222 -p 8080:8080 -e PORT=8080 -d xdtianyu/docker:chisel
```

## Connect via docker exec

```shell
docker exec -it CONTAINER_NAME bash
```

## Connect via ssh

`root` password is `root`, `ty` password is `ty`.

```shell
ssh ty@localhost -p 2222
su -
```

Please notice Heroku docker does not support USER and root privilege, so you can not connect to heroku docker via ssh.

## Connect via http

Open `http://localhost:8080/ttyd` in your browser, username and password is `root`

## Nginx proxy heroku example

Here is an example if you want proxy `https://YOUR_APP_NAME.herokuapp.com` with `https://www.example.org/chisel`.

```
    location /chisel {
        proxy_pass https://YOUR_APP_NAME.herokuapp.com;
        resolver 8.8.8.8;
        proxy_set_header Host YOUR_APP_NAME.herokuapp.com;
        proxy_buffering off;
        proxy_connect_timeout   10;
        proxy_send_timeout      15;
        proxy_read_timeout      20;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
```

And then you can run chisel with your own domain.

```shell
chisel client -v https://www.example.org/chisel 3128
```
