#!/usr/bin/env bash

checkleap(){
    year=$1
    if [ $((year % 4)) -eq 0 ] && [ $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]  
    then
        echo 'true'
    else
        echo 'false'
    fi
}

main(){
if [ "$#" -ne 1 ] || [[ ! "$1" =~ ^[0-9]+$ ]]
then
    echo "Usage: leap.sh <year>"
    exit 1
else
    checkleap "$1"
fi
}

main "$@"