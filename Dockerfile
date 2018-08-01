FROM debian:latest

ENV MTA_USER="2000" \
    MTA_GROUP="2000"

ADD entrypoint.sh /entrypoint.sh

RUN groupadd -g "$MTA_GROUP" mtasa && \
    useradd -u "$MTA_USER" -g "$MTA_GROUP" -d /home/mtasa -m mtasa && \
    apt-get update && \
    apt-get install -y wget unzip && \
    chmod -R 775 /home/mtasa
    cd /home/mtasa && \
    wget -O mta.tar.gz https://linux.mtasa.com/dl/153/multitheftauto_linux_x64-1.5.3.tar.gz && \
    tar xfz mta.tar.gz && \
    mv multitheftauto_linux_* mtasa && \
    rm mta.tar.gz && \
    chown -R mtasa:mtasa mtasa && \
    chmod 777 /entrypoint.sh

VOLUME /home/mtasa/mtasa/mods/deathmatch

EXPOSE 22003 22005 22126

USER mtasa

CMD ["/entrypoint.sh"]
