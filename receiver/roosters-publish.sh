#!/bin/sh
# sync-roosters.sh
# Gemaakt:      1 mrt 2012 - Jan Bouma
# Gewijzigd:    1 mrt 2012 - Jan Bouma
rm -rf /var/sync/roosters/roosters.tar.bz2
rm -rf /var/sync/roosters/website
mkdir /var/sync/roosters/website
cp /var/sync/roosters.tar.bz2 /var/sync/roosters/roosters.tar.bz2
tar -xjf /var/sync/roosters/roosters.tar.bz2 -C /var/sync/roosters/website --strip-components 1
chmod -R 755 /var/sync/roosters/website
cp -rf /var/sync/roosters/website/* /var/www/sites/roosters/
cp -rf /var/sync/roosters/skeleton/* /var/www/sites/roosters/
