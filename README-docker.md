# Creating and running docker images

## Build

### VTS-VTSD

```
docker build -t vts-vtsd:latest -f docker/vtsd/Dockerfile .
```

### VTS-Mapproxy


```
docker build -t vts-mapproxy:latest -f docker/mapproxy/Dockerfile .
```

## Run docker image

### VTS-VTSD

1. If needed create *Storage* volume (see
   http://vtsdocs.melown.com/en/latest/introduction.html#storage) where your
   surface data can be uploaded and managed

```
docker volume create vtsd-storage
```
    This is not required, since VTS-VTSD will create `storage` directory
    automatically in `/var/vts/store` directory

2. Run docker image

```
docker run -ti -p 3060:3060 vts-vtsd -v vtsd-storage:/var/vts/store:rw
```

