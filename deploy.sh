#!/bin/bash
set -eu -o pipefail
# Ensure DOMAIN is set to your base domain. "nextcloud.DOMAIN" will be used
# by Traefik for connections as well as SSL certificates
#
# $ env DOMAIN=mydomain.com ./deploy.sh

# This should Just Work but it probably won't.
env TR_FRONT="Host: nextcloud.${DOMAIN}" docker stack deploy -c docker-compose.yml nextcloud --prune
