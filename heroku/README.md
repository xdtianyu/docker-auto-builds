## docker heroku

A docker image which can be connected by ssh or http runs on heroku.

## Run in background

```shell
docker run -it -p 2222:2222 -p 8080:8080 -e PORT=8080 -d xdtianyu/docker:heroku
```

## Connect via ssh

`root` password is `root`

```shell
ssh root@localhost -p 2222
```

## Connect via http

Open `http://localhost:8080/ttyd` in your browser, username and password is `root`
