#!/usr/bin/env bash

reverse_string(){
    string="$*"
    for ((i = ${#string}; i >= 0; i--))
    do
        echo -n "${string:$i:1}"
    done
}

main(){
    if [ -z "$*" ]
    then
        echo ""
    else 
        reverse_string "$1"
    fi
}

main "$@"