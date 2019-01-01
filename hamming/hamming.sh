#!/usr/bin/env bash

calculate_hamming_distance(){
    declare -i distance=0
    for ((count=0; count<=${#1}; count++))
    do
        if [ "${1:$count:1}" != "${2:$count:1}" ]
        then
        distance=$((distance+1))
        fi
    done
    echo ${distance}
}

main(){
if [ -z "$*" ] || [ "$#" -ne 2 ]
then
    echo "Usage: hamming.sh <strand1> <strand2>"
    exit 1
elif [ ${#1} != ${#2} ]
then
    echo "left and right strands must be of equal length"
    exit 1
else 
    calculate_hamming_distance "$1" "$2"
fi
}

main "$@"