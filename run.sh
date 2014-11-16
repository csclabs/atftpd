#!/bin/bash
wget -q -O /tftpboot/hanlon.ipxe ${HANLON_PORT/tcp/http}/hanlon/api/v1/config/ipxe
chmod -R 700 /tftpboot
chown -R nobody:nogroup /tftpboot/
/usr/sbin/atftpd --user nobody.nogroup --daemon --no-fork --port 69 --logfile /dev/stdout /tftpboot
