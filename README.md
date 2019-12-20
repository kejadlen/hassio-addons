# hassio-addons

This is abandoned. It wound up being easier for me to just manage Docker
containers directly, rather than try to remake them as Hass.io add-ons. The
ddclient add-on works, the traefik add-on mostly works, and the syncthing one
was in progress when I stopped.

## Notes

Debugging locally:

```
docker build --build-arg BUILD_FROM="homeassistant/amd64-base:latest" -t local/IMAGE DIR
docker run --rm -v `pwd`/tmp:/data local/IMAGE
```
