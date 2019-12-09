#!/usr/bin/env bashio
set +u

CONFIG_PATH=/data/options.json
DDCLIENT_CONF_PATH=/etc/ddclient/ddclient.conf

declare -a HOSTS
for host in $(jq --compact-output ".hosts[]" $CONFIG_PATH); do
  ENTRY=$(jq --raw-output '[.protocol,.login,.password,.host] | "protocol=\(.[0]), login=\(.[1]), password=\(.[2]) \(.[3])"' <<< ${host})
  HOSTS+=("${ENTRY}")
done

cat <<-EOF > $DDCLIENT_CONF_PATH
daemon=300
use=web
ssl=yes

$(printf "%s\n" "${HOSTS[@]}")
EOF

chmod 600 $DDCLIENT_CONF_PATH

ddclient -foreground -verbose

# vim: ft=bash
