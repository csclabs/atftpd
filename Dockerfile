FROM ubuntu:latest

MAINTAINER Joseph Callen <jcpowermac@gmail.com>

RUN apt-get -y update \
    && apt-get -y install wget syslinux atftpd \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

RUN mkdir -p /tftpboot/pxelinux.cfg
COPY ipxe.lkrn /tftpboot/
COPY undionly.kpxe /tftpboot/
COPY default /tftpboot/pxelinux.cfg/
COPY run.sh /

RUN cp /usr/lib/syslinux/menu.c32 /tftpboot
RUN cp /usr/lib/syslinux/pxelinux.0 /tftpboot
RUN chmod -R 700 /tftpboot/
RUN chown -R nobody:nogroup /tftpboot/
RUN chmod -R 755 /run.sh

CMD /run.sh
EXPOSE 69/udp
