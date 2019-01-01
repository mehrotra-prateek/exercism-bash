#! /usr/bin/env bash

steps(){
    count_of_steps=0
    number="$1"
    while [ "${number}" -ne 1 ]
    do
        if [ $((number%2)) -eq 0 ]
        then
            number=$((number/2))
        else
            number=$((3*number + 1))
        fi
        ((count_of_steps++))
    done
    echo "${count_of_steps}"
}

main(){
    if [ "$#" -ne 1 ]
    then
        echo "Usage: collatz_conjecture.sh <number>"
        exit 1
    elif [ "$1" -le 0 ] 
    then
        echo "Error: Only positive numbers are allowed"
        exit 1
    else
        steps "$1"
    fi
}

main "$@"