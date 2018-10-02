# VTS-Backend

[VTS-Backend](https://github.com/melown/vts-backend) is debian package build
project, for getting [VTS-Mapproxy](https://github.com/melown/vts-mapproxy),
[VTS-VTSD](https://github.com/melown/vts-vtsd) and 
[VTS-Tools](https://github.com/melown/vts-tools) on the server the fast way,
with one `apt-get install` command.

## Download, build and install

### Clone and Download

The source code can be downloaded from
[GitHub repository](https://github.com/melown/vts-backend), but since there
are
external dependences, you have to use `--recursive` switch while cloning the
repo.


```
git clone --recursive https://github.com/Melown/vts-backend.git 
```

**NOTE:** If you did clone from GitHub previously without the `--recursive`
parameter, you should probably delete the `vts-backend` directory and clone
again. The build will not work otherwise.

Now got to `vts-backend` directory and run `make

```
cd vts-backend/vts-backend
make deb
```

NOTE: It may endup with error, saying, that the package could not be signed

```
dpkg-buildpackage: error: failed to sign .changes file
```

Still, the package should be created.

## Docker

You may now be able to go back to root directory and continue as described in
[README-docker.md](README-docker.md) file.

