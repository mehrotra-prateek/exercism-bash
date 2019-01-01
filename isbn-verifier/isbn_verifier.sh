#!/usr/bin/env bash

validate_isbn(){
    for ((count=0; count<${#1}; count++))
    do
        char="${1:$count:1}"
        if [ $char == 'X' ]
        then
            char=10 
        fi
        check_sum=$(( "${check_sum}" + ( "${char}" * ( 10 - "${count}" ) ) ))
    done
    check_digit=$(( "${check_sum}" % 11 ))
    if [ $check_digit != 0 ]
    then
        echo "false"
    else
        echo "true"
    fi 
}

validate_isbn_checkdigit(){
    for ((count=0; count<${#1}-1; count++))
    do
        char="${1:$count:1}"
        if [[ $char =~ X ]]
        then
         echo "false"
         exit 0
        fi
    done
    validate_isbn "${1}"
}

validate_input_length(){
    if [[ ${#1} == 10 || ${#1} == 13 ]]
    then
        validate_isbn_checkdigit "${1}"
    else
        echo "false"
        exit 0
    fi
    
}

validate_input(){
for ((count=0; count<${#1}; count++))
do
    char="${1:$count:1}"
    if ! [[ $char =~ [0-9] || $char =~ - || $char =~ X ]]
    then
    echo "false"
    exit 0
    fi
done
validate_input_length "${1//-}"
}

main(){
    if [ "$#" -ne 1 ]
    then
        echo "Usage: isbn_verifier.sh <isbn_value>"
        exit 0
    else
        validate_input "$1"
    fi
}

main "$@"