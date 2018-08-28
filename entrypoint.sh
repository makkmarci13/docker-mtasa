#!/bin/bash
set -e

cd /home/container

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
 
if [ ! -e mods/deathmatch/mtaserver.conf ]; then
    echo "Downloading config and resources..."
    rmdir baseconfig
    mkdir mods/deathmatch/resources
    cd mtasa/deathmatch/resources/
    wget -O resources.zip http://mirror.mtasa.com/mtasa/resources/mtasa-resources-latest.zip
    unzip resources.zip
    rm resources.zip
fi

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}

# Start mtasa server
# exec /home/mtasa/mtasa/mta-server64 -n -t -u --maxplayers $SERVER_SLOT
