#!/usr/bin/env bashio
set +u

CONFIG_PATH=/data/options.json
DDCLIENT_CONF_PATH=/etc/ddclient/ddclient.conf

printf "daemon=300\n\n" > $DDCLIENT_CONF_PATH

for host in $(jq --compact-output ".hosts[]" $CONFIG_PATH); do
  printf "protocol=$(echo ${host} | jq --raw-output .protocol), " >> $DDCLIENT_CONF_PATH
  printf "login=$(echo ${host} | jq --raw-output .login), " >> $DDCLIENT_CONF_PATH
  printf "password=$(echo ${host} | jq --raw-output .password) " >> $DDCLIENT_CONF_PATH
  printf "$(echo ${host} | jq --raw-output .host)\n" >> $DDCLIENT_CONF_PATH
done

chmod 600 $DDCLIENT_CONF_PATH

ddclient -foreground -verbose
