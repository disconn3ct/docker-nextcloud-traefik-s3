#!/bin/bash

# Stolen from postgres.
file_env() {
  local var="$1"
  local fileVar="${var}_FILE"
  local def="${2:-}"
  if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
    echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
    exit 1
  fi
  local val="$def"
  if [ "${!var:-}" ]; then
    val="${!var}"
  elif [ "${!fileVar:-}" ]; then
    val="$(< "${!fileVar}")"
  fi
  export "$var"="$val"
  unset "$fileVar"
}

file_env "MYSQL_PASSWORD"
file_env "POSTGRES_PASSWORD"
file_env "NEXTCLOUD_ADMIN_USER"
file_env "NEXTCLOUD_ADMIN_PASSWORD"
file_env "NEXTCLOUD_TRUSTED_DOMAINS"
file_env "SMTP_NAME"
file_env "SMTP_PASSWORD"

exec "$@"
