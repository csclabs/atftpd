FROM ubuntu:14.04

MAINTAINER Joseph Callen <jcpowermac@gmail.com>

COPY run.sh /
COPY build.yml /
COPY atftp.yml /
COPY default /tftpboot/pxelinux.cfg/

RUN apt-get -y update \
    && apt-get -y install ansible wget \
    && /usr/bin/ansible-playbook -c local -i localhost, /build.yml \
    && /usr/bin/ansible-playbook -c local -i localhost, /atftp.yml \
    && apt-get -y purge ansible \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* \
    && chmod -R 700 /tftpboot/ \
    && chown -R nobody:nogroup /tftpboot/ \
    && chmod 755 /run.sh

CMD /run.sh
EXPOSE 69/udp
