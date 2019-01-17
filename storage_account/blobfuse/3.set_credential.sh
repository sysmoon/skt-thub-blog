#!/bin/bash
export AZURE_STORAGE_ACCOUNT="$1"
export AZURE_STORAGE_ACCESS_KEY="$2"

printf "check azure storage account credential\n"
printf "AZURE_STORAGE_ACCOUNT=%s \n" $1
printf "AZURE_STORAGE_ACCESS_KEY=%s \n" $2
