# hassio-addons

Debugging locally:

```
docker build --build-arg BUILD_FROM="homeassistant/amd64-base:latest" -t local/IMAGE DIR
docker run --rm -v `pwd`/tmp:/data local/IMAGE
```
