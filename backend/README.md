## Docker backend demo based on python-eve and mongodb

## Run in background

```shell
docker run -it -p 80:80 -p 22:22 -d xdtianyu/docker:backend
```

## eve api and Mongodb web management

All web interface user and password is `test`

`http://localhost:80/api/v1` is the api service.

`http://localhost:80/mongo` is adminMongo web interface.

`http://localhost:80/express` is mongo-express web interface.

You can login docker container with ssh:

```shell
ssh root@localhost -p22
```

And the root password is `root`.
