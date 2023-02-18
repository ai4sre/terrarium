#!/bin/sh

echo 'Configuring Slack hook url.'

# To avoid read-only file system error
cp -fp /etc/alertmanager/alertmanager_config.yaml /alertmanager/config.yaml
sed -i -e s,API_URL_SECRET,"$SLACK_HOOK_URL",g /alertmanager/config.yaml

exec /bin/alertmanager $*
