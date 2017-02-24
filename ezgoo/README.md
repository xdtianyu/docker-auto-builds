## docker chisel

A docker image which runs [ezgoo](https://github.com/Lafeng/ezgoo)

## Run in background

```shell
docker run -it -p 2222:2222 -p 8080:8080 -e PORT=8080 -d xdtianyu/docker:ezgoo
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

Open `http://localhost:8080` in your browser, username and password is `google`.
