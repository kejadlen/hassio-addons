#!/usr/bin/env bashio
set +u

CONFIG_PATH=/data/options.json
TRAEFIK_DYNAMIC_CONF_PATH=/data/traefik.toml

routers=`jq --raw-output --from-file routers.jq < $CONFIG_PATH`
services=`jq --raw-output --from-file services.jq < $CONFIG_PATH`

cat <<-EOF > $TRAEFIK_DYNAMIC_CONF_PATH
[http.routers]
$routers

[http.services]
$services
EOF

./traefik

# vim: ft=bash
