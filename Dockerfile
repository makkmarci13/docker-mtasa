FROM debian:latest
   
ENV UID=1000 \
    SERVER_SLOT=32
    
RUN apk add --no-cache -U \
            su-exec
    
ADD entrypoint.sh /entrypoint.sh
ADD start.sh /start.sh

RUN useradd -u 1000 -d /home/mtasa -m mtasa && \
    apt-get update && \
    apt-get install -y wget unzip && \
    apt-get -y install sudo && \
    cd /home/mtasa && \
    wget -O mta.tar.gz https://linux.mtasa.com/dl/153/multitheftauto_linux_x64-1.5.3.tar.gz && \
    tar xfz mta.tar.gz && \
    mv multitheftauto_linux_* mtasa && \
    rm mta.tar.gz && \
    chown -R mtasa mtasa && \
    chmod 777 /entrypoint.sh && \
    chmod 777 /start.sh
    
RUN chmod +x /entrypoint.sh

VOLUME /home/mtasa/mtasa/mods/deathmatch

EXPOSE 22003 22005 22126

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/start.sh"]
