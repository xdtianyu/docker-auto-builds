## docker chisel

A docker image which runs [chisel](https://github.com/jpillora/chisel) and squid.

## Run in heroku

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
docker run -it -p 2222:2222 -p 8080:8080 -d xdtianyu/docker:chisel
```

## Connect via ssh

`root` password is `root`

```shell
ssh root@localhost -p 2222
```

## Connect via http

Open `http://localhost:80/ttyd` in your browser, username and password is `root`
