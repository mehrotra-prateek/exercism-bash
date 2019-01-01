#!/usr/bin/env bash

total_grains(){
total_grain_count=0
    for chess_square in {0..63}
    do
        total_grain_count=$(echo $total_grain_count+2^$chess_square|bc)
    done
    echo "${total_grain_count}"
}

grain_calc() {
    if [[ $1 -le 0 || $1 -gt 64 ]]
    then 
        echo "Error: invalid input"
        exit 1
    else
        grain_count=$(( 2**($1 - 1) ))
        echo "${grain_count#-}"
    fi
}

main (){
    if [ -z "$*" ]
    then
        echo "Error: invalid input"
        exit 1
    elif [ "$1" == "total" ]
    then
        total_grains "$1"
    else
        grain_calc "$1"
    fi
}
    
main "$@"
