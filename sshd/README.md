## docker sshd

A docker image which can be connected by ssh or http.

## Run in background

```shell
docker run -it -p 22:22 -p 80:80 -d xdtianyu/docker:sshd
```

## Connect via ssh

`root` password is `root`

```shell
ssh root@localhost -p 22
```

## Connect via http

Open `http://localhost:80/ttyd` in your browser, username and password is `root`
