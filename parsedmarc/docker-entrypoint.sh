#!/bin/bash
set -e

envsubst '$$GEOIP_ACCOUNT_ID $$GEOIP_LICENSE_KEY $$GEOIP_EDITION_IDS' < /etc/GeoIP.template.conf > /etc/GeoIP.conf
envsubst '$$DMARC_SAVE_AGGREGATE $$DMARC_SAVE_FORENSIC $$IMAP_HOST $$IMAP_PORT $$IMAP_USERNAME $$IMAP_PASSWORD $$ELASTICSEARCH_HOSTS $$ELASTICSEARCH_SSL $$ELASTICSEARCH_NUMBER_OF_SHARDS $$ELASTICSEARCH_NUMBER_OF_REPLICAS' < /etc/parsedmarc.template.ini > /etc/parsedmarc.ini

geoipupdate

exec "$@"
