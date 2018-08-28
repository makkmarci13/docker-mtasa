#!/bin/bash
set -e

 cd /home/mtasa/
 
 if [ ! -e mtasa/mods/deathmatch/mtaserver.conf ]; then
    echo "Downloading config and resources..."
    wget -O baseconfig.tar.gz https://linux.mtasa.com/dl/153/baseconfig-1.5.3.tar.gz
    tar xfz baseconfig.tar.gz
    mv baseconfig/* mtasa/mods/deathmatch/
    rmdir baseconfig
    mkdir mtasa/mods/deathmatch/resources
    cd mtasa/mods/deathmatch/resources/
    wget -O resources.zip http://mirror.mtasa.com/mtasa/resources/mtasa-resources-latest.zip
    unzip resources.zip
    rm resources.zip
fi

 # Start mtasa server
exec /home/mtasa/mtasa/mta-server64 -n -t -u --maxplayers $SERVER_SLOT
