#!/usr/bin/env bashio
set +u

CONFIG_PATH=/data/options.json
DDCLIENT_CONF_PATH=/etc/ddclient/ddclient.conf

hosts=$(jq --raw-output '.hosts[] | "protocol=\(.protocol), login=\(.login), password=\(.password) \(.host)"' < $CONFIG_PATH)

cat <<EOF > $DDCLIENT_CONF_PATH
daemon=300

use=web
ssl=yes

$hosts
EOF

chmod 600 $DDCLIENT_CONF_PATH

ddclient -foreground -verbose

# vim: ft=bash
