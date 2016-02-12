#!/bin/bash
wget --retry-connrefused --waitretry=5 --read-timeout=5 --timeout=5 -t 10 -q -O /tftpboot/hanlon.ipxe ${HANLON_PORT/tcp/http}/hanlon/api/v1/config/ipxe

if [ $? -ne 0 ]
then 
  echo "Unable to download iPXE script from Hanlon container"
  exit 1
fi

chmod -R 700 /tftpboot
chown -R nobody:nogroup /tftpboot/
/usr/sbin/atftpd --user nobody.nogroup --daemon --no-fork --port 69 --logfile /dev/stdout /tftpboot
