#!/usr/bin/env bash

create_acronym(){
    declare acronym=""
    for word in ${1/-/ }
    do
        acronym=$acronym${word:0:1}
    done
    echo "${acronym^^}"
}

main(){
    if [[ "$#" -ne 1 ]]
    then
        echo "Usage: sh acronym.sh <value>"
    else
        create_acronym "${1}"
    fi
}

main "$@"