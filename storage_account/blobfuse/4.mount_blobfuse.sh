#!/bin/bash
#sudo blobfuse /home/tviewdev/blobfusetmp1 --tmp-path=/mnt/ramdisk/blobfusetmp --config-file=/home/tviewdev/blobfuse/fuse_connection.cfg -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120

print_usage ()
{
    printf "\n"
    printf "Usage: \n"
    printf "mount_blobfuse.sh ram(or ssd) <type> /home/tviewdev/tv-media-data <mount_path> tv-media-data <container-name> \n"
    printf "\n"
}

if [ "$# -ne 3" ]; then
  print_usage
  exit 1
fi

case $1 in
  "ram")
    printf "create blobfuse mount(%s) using ram cache(%s)" $2 $3
    sudo blobfuse $2 --container-name=$3 --tmp-path=/mnt/ramdisk/blobfusetmp 
    ;;
  "ssd")
    printf "create blobfuse mount(%s) using ssd cache(%s)" $2 $3
    sudo blobfuse $2 --container-name=$3 --tmp-path=/mnt/ssddisk/blobfusetmp 
    ;;
esac

printf "create blobfuse mount done \n"

