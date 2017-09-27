# Creating and running docker images

## Build

Before you start, please make sure, you did `make` in the `vts-backend`
directory, as described in the [README.md](README.md) file.

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


1. Run mapproxy with default examples

```
docker run -ti -p 3070:3070 --name mapproxy vts-mapproxy
```

You should be able to visit http://localhost:3070/melown2015/surface/examples/srtm1-n47-e013/ and see some nice surfaces.

2.  If you have already configured mapproxy project, you can add your local
 directory with the project to the image:

```
docker run -ti -p 3070:3070 --name mapproxy --rm -v projects/mapproxy-wmts:/vts/datasets/mapproxy-wmts:rw vts-mapproxy
```

In this example, we've add local `projects/mapproxy-wmts` directory to
`/vts/datasets/`. the `mapproxy-wmts` directory is cotaining `resources.json`
file, which is essential for mapproxy. Then you can visit
http://localhost:3070/melown2015/surface/melown/dem/ and see the example,
already published at http://vtsdocs.melown.com/en/latest/server/mapproxy/examples/freelayer.html
