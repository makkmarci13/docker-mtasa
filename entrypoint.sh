#!/bin/bash
cd /home/container

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
 
if [ ! -e ./deathmatch/mtaserver.conf ]; then
    echo "Downloading config and resources..."
    wget -O baseconfig.tar.gz https://linux.mtasa.com/dl/153/baseconfig-1.5.3.tar.gz
    tar xfz baseconfig.tar.gz
    mv baseconfig/* ./mods/deathmatch/
    rmdir baseconfig
    mkdir ./mods/deathmatch/resources
    cd ./mods/deathmatch/resources/
    wget -O resources.zip http://mirror.mtasa.com/mtasa/resources/mtasa-resources-latest.zip
    unzip resources.zip
    rm resources.zip
fi

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
