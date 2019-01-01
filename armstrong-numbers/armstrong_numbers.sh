#!/usr/bin/env bash

calculate(){
    number="$1"
    for ((i = 0;i < "${#number}"; i++))
    do
        digit=${number:$i:1}
        armstrong_total=$((armstrong_total + (digit ** "${#number}") ))
    done

    if [ "${number}" -eq "${armstrong_total}" ]
    then
        echo "true"
    else
        echo "false"
    fi
}

main(){
    if [ "$#" -ne 1 ]
    then
        echo "Usage: armstrong_numbers <number>"
        exit 1
    else
        calculate "$1"
    fi
}

main "$@"