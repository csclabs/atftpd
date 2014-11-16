# atftpd Build

This docker container is for tftpd specifically for [Hanlon](https://github.com/csc/Hanlon).

## Build Image

To correctly build the image you will need [jcpowermac/ipxe-build](https://github.com/jcpowermac/ipxe-build.git) as well.

Clone the repo.

`git clone https://github.com/jcpowermac/atftpd.git`

Create a local docker image.

`docker build -t jcpowermac/atftpd .`

## Run Hanlon 

`chmod 755 example_hanlon_start_containers.sh`

`./example_hanlon_start_containers.sh`



