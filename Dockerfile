FROM        debian:latest

LABEL       author="makkmarci13" maintainer="makkmarci03@gmail.com"

RUN         apt update \
            && apt upgrade -y \
            && apt install -y libmysqlclient-dev libstdc++6 lib32stdc++6 tar curl iproute2 openssl wget unzip \
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
