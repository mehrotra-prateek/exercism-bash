#!/usr/bin/env bash

cleanup_phone(){
    declare phno=""
    phno=${1//[^0-9]/}
    if [[ ${#phno} == 11 ]] && [[ ${phno:0:1} == 1 ]]
    then
        phno="${phno:1:10}"
    fi
    if [[ ${#phno} == 10 ]] && ! [[ ${phno:0:1} =~ [0-1] ]] && ! [[ ${phno:3:1} =~ [0-1] ]]
    then
        echo "${phno}"    
    else
        echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
        exit 1
    fi
}

main(){
    if [[ "$#" -ne 1 ]]
    then
        echo "Usage: Input phone number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
        exit 0
    else
        cleanup_phone "${1}"
    fi
}

main "$@"