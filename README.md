## Building the image
```
docker build -t mongodb_centos .
```

## Run
```
docker rm -fv mongodb_centos_run; rm -f mongod/{ftdc,logs}/* ;\
docker run --shm-size=256m --name mongodb_centos_run -d --rm -p 27020:27017 --memory="5g" -v $(pwd)/mongod/ftdc:/mongo/data/db/diagnostic.data -v $(pwd)/mongod/logs:/mongo/data/db/logs mongodb_centos &&\
sleep 5; docker exec -ti mongodb_centos_run mongo
```

## Bash
```
docker exec -ti mongodb_centos_run mongo
docker exec -ti mongodb_centos_run bash
```