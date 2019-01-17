#!/bin/bash

print_usage(){
  printf "\n"
  printf "Usage: \n"
  printf "mount_cache_disk.sh ram(or ssd)<type> 2g<size> /mnt/ramdisk<path>"
  printf "\n"
}

if [ "$#" -ne 3 ]; then
  print_usage
  exit 1
fi

case $1 in
  "ram")
    printf "create %s cache, size %s, path=%s\n" $1 $2 $3
    sudo mount -t tmpfs -o size=2g tmpfs /mnt/ramdisk
    sudo mkdir /mnt/ramdisk/blobfusetmp
    sudo chown $USER /mnt/ramdisk/blobfusetmp
    ;;
  "ssd")
    printf "create %s cache, size %s, path=%s\n" $1 $2 $3
    sudo mkdir /mnt/ssddisk/blobfusetmp
    sudo chown $USER /mnt/ssddisk/blobfusetmp
esac

printf "create cache done \n"
