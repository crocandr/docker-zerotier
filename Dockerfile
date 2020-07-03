FROM ubuntu:focal

RUN apt-get update && apt-get install -y curl screen supervisor gnupg
RUN curl -L -o /tmp/zerotier-install.sh https://install.zerotier.com/ && bash /tmp/zerotier-install.sh || exit 0

COPY files/supervisor-zerotier.conf /etc/supervisor/conf.d
COPY files/start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

ENTRYPOINT /opt/start.sh
