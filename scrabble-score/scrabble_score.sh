#!/usr/bin/env bash

scrabble() {
    string="$*"
    for ((i=0; i <= ${#string}; i++))
    do
        character="${string:$i:1}"
        case "${character,,}" in
        ["aeioulrstn"])
            score=$(( score + 1 ))
            ;;
        ["dg"])
            score=$(( score + 2 ))
            ;;
        ["bcmp"])
            score=$(( score + 3 ))
            ;;
        ["fhvwy"])
            score=$(( score + 4 ))
            ;;
        ["k"])
            score=$(( score + 5 ))
            ;;
        ["jx"])
            score=$(( score + 8 ))
            ;;
        ["qz"])
            score=$(( score + 10 ))
            ;;
        esac
    done
    echo "${score}"
}    

main() {
    if [ -z "$*" ]
    then 
        echo 0
    else
        scrabble "$1"
    fi
}

main "$@"