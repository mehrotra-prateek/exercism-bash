#!/usr/bin/env bash

sound(){
    number=$1
    ((number%3==0)) && string+=Pling
    ((number%5==0)) && string+=Plang
    ((number%7==0)) && string+=Plong
    
    if [ -z $string ]
    then
        string="${number}"
    fi
    echo "${string}"
}

main(){
    if [ "$#" -ne 1 ]
    then
        echo "Usage: raindrops.sh <number>"
    else
        sound "$1"
    fi
}

main "$@"