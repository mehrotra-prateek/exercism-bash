#!/usr/bin/env bash

check_isogram(){
    input_string=${1/[^a-z]/}
    for (( count=0; count<"${#input_string}"; count++ ))
    do 
       repeat_count=0
       for (( counter=0; counter<"${#input_string}"; counter++ ))
       do
            if [[ "${input_string:$count:1}" == "${input_string:$counter:1}" ]]
            then
                repeat_count=$(( repeat_count + 1 ))
            fi
       done
       if [[ ${repeat_count} != 1 ]]
       then
        echo "false"
        exit 0
       fi 
    done
    echo "true"
}

main(){
    if [[ "$#" -ne 1 ]]
    then
        echo "Usage: ./isogram.sh '<input sentence>' "
    else
        check_isogram "${1,,}"
    fi
}

main "$@"