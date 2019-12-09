#!/usr/bin/env bashio
set +u

CONFIG_PATH=/data/options.json
DDCLIENT_CONF_PATH=/etc/ddclient/ddclient.conf

echo "daemon=300\n\n" > $DDCLIENT_CONF_PATH

for host in $(jq --compact-output ".hosts" $CONFIG_PATH); do
  echo "protocol=$(echo ${row} | jq .protocol), " >> $DDCLIENT_CONF_PATH
  echo "login=$(echo ${row} | jq .login), " >> $DDCLIENT_CONF_PATH
  echo "password=$(echo ${row} | jq .password) " >> $DDCLIENT_CONF_PATH
  echo "$(echo ${row} | jq .host)\n" >> $DDCLIENT_CONF_PATH
done

chmod 600 $DDCLIENT_CONF_PATH

# ddclient -daemon 300 -foreground -verbose
ddclient -foreground -verbose
