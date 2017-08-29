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
docker run -ti -p 3060:3060 -v vtsd-storage:/var/vts/store:rw --name vtsd vts-vtsd
```

### VTS-Mapproxy

1. If needed, create *Datasets* volume - this is the place, where `vts-mapproxy` is
   looking for data as configured in `mapproxy.conf` file

```
docker volume create mapproxy-dataset
```


3. Adjust and copy the `resources.json` file to target volume

################################################################
# TODO TADY TO NEFUNGUJE
################################################################

```
$EDITOR docker/mapproxy/resources.json
docker volume cp docker/mapproxy/resources.json mapproxy-dataset:/
```

4. Add some local datasets you have created according to examples described in
   documentation http://vtsdocs.melown.com/en/latest/tutorials/index.html

```
docker cp $DATASETS mapproxy-datasets:/
```

5. Run mapproxy with default examples

```
docker run -ti -p 3070:3070 --name mapproxy vts-mapproxy
```

6. In case, you have your own datasets, you can mount your own volume and run
   your custom data

```
docker run -ti -p 3070:3070 -v mapproxy-dataset:/var/vts/mapproxy/datasets:rw --name mapproxy vts-mapproxy
```

