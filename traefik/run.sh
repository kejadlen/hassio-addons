#!/usr/bin/env bashio

# CONFIG_PATH=/data/options.json
# TRAEFIK_DYNAMIC_CONF_PATH=/data/traefik.toml
TRAEFIK_CONF_DIR=/data/traefik

mkdir -p $TRAEFIK_CONF_DIR

addons=$(bashio::config "addons")

bashio::log.info $(bashio::addon.webui "traefik")

bashio::log.info "${addons}"

# cat <<-EOF > $TRAEFIK_DYNAMIC_CONF_PATH
# [http.routers]
# $routers

# [http.services]
# $services
# EOF

# ./traefik

# vim: ft=bash
