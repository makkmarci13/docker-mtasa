FROM debian:latest
   
ENV SERVER_SLOT=32
    
ADD start.sh /start.sh

RUN mkdir /home/mtasa && \
    apt-get update && \
    apt-get install -y wget unzip && \
    cd /home/mtasa && \
    wget -O mta.tar.gz https://linux.mtasa.com/dl/153/multitheftauto_linux_x64-1.5.3.tar.gz && \
    tar xfz mta.tar.gz && \
    mv multitheftauto_linux_* mtasa && \
    rm mta.tar.gz && \
    chmod 777 /start.sh

VOLUME /home/mtasa/mtasa/mods/deathmatch

EXPOSE 22003 22005 22126

CMD ["/start.sh"]
