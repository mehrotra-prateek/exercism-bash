#!/usr/bin/env bash

encryption(){
    declare encrypt=""
    declare -i count=0 counter=0
    plain="abcdefghijklmnopqrstuvwxyz"
    cipher="zyxwvutsrqponmlkjihgfedcba"
    input_string=${1//[^a-z0-9]/}
    for ((count=0; count<${#input_string}; count++ ))
    do
        status=false
        for ((counter=0;counter<${#plain};counter++))
        do
            if [[ "${input_string:$count:1}" == "${plain:$counter:1}" ]]
            then
                encrypt+="${cipher:$counter:1}"
                status=true
            fi
        done
        if [[ $status = "false" ]]
        then
            encrypt+="${input_string:count:1}"
        fi
    done
    echo "${encrypt}"
}

encode(){
    declare secret=""
    value=$(encryption "${1}")
    if [[ ${#value} -lt 5 ]]
    then
        echo "${value}"
    else
        secret+=${value:0:5}
        for (( count=5;count<${#value};count+=5 ))
        do
            secret+=" ${value:count:5}"
        done
        echo "${secret}"
    fi
}

decode(){
    value=$(encryption "${1}")
    echo "${value//[[:blank:]]/}"
}

main(){
    if [ "$#" -ne 2 ] || [[ "${1}" != "encode" && "${1}" != "decode" ]]
    then
        echo "Usage: atbash_cipher.sh <encode/decode> <value>"
        exit 0
    elif [[ "${1}" == "encode" ]]
    then 
        encode "${2,,}"
    else 
        decode "${2,,}"
    fi
}

main "$@"