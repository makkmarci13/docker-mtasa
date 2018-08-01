#!/bin/bash
set -e

cd /home/mtasa/

if [ ! -e mtasa/mods/deathmatch/mtaserver.conf ]; then
    echo "Downloading config and resources..."
    su-exec wget -O baseconfig.tar.gz https://linux.mtasa.com/dl/153/baseconfig-1.5.3.tar.gz
    su-exec tar xfz baseconfig.tar.gz
    su-exec mv baseconfig/* mtasa/mods/deathmatch/
    su-exec rmdir baseconfig
    su-exec mkdir mtasa/mods/deathmatch/resources
    su-exec cd mtasa/mods/deathmatch/resources/
    su-exec wget -O resources.zip http://mirror.mtasa.com/mtasa/resources/mtasa-resources-latest.zip
    su-exec unzip resources.zip
    su-exec rm resources.zip
fi

# Start mtasa server
su-exec /home/mtasa/mtasa/mta-server64 -n -t -u --maxplayers $SERVER_SLOT
