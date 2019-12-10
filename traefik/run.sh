#!/usr/bin/env sh
set -e

CONFIG_PATH=/data/options.json
TRAEFIK_DYNAMIC_CONF_PATH=/data/traefik.toml

cat <<-EOF > $TRAEFIK_DYNAMIC_CONF_PATH
[http.routers]
  [http.routers.traefik]
    entryPoints = ["http"]
    rule = "Host(\`traefik.kejadlen.dev\`)"
    # middlewares = ["redirect-https"]
    service = "traefik"
    # [http.routers.traefik.tls]

[http.services]
  [http.services.traefik.loadBalancer]
    [[http.services.traefik.loadBalancer.servers]]
      url = "http://15729e2b-traefik:8080/"
EOF

traefik

# vim: ft=sh
