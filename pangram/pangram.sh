#!/usr/bin/env bash

check_pangram(){
    for letter in {a..z}
    do
        if ! [[ "$1" =~ ${letter} ]]
        then 
            echo "false"
            exit 0
        fi
    done
    echo "true"
}

main(){
    if [ "$#" -ne 1 ]
    then
        echo "Usage: pangram.sh <test-input>"
        exit 1
    elif [ "$1" == "" ]
    then
        echo "false"
        exit 0
    else
        check_pangram "${1,,}"
    fi
}

main "$@"