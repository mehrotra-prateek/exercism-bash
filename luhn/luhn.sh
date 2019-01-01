#! /usr/bin/env bash
# set -x

luhn_check(){
    if [[ ${1}%10 -eq 0 ]]
    then
        echo "true"
    else
        echo "false"
    fi
}

luhn_sum(){
    number=$1
    declare -i sum=0
    declare -i count=0
    declare -i value=0
    for ((position=${#number}-1; position>=0; position--))
    do
        count+=1
        value=${number:position:1}
        if [[ $count%2 -eq 0 ]]
        then
            if [[ $((2*${number:position:1})) -gt 9 ]]
            then
                value=$((2*${number:position:1}-9))
            else
                value=$((2*${number:position:1}))
            fi
        fi
        sum+=$value
    done
    echo "${sum}"
}

main(){
    if [[ "$#" -ne 1 ]]
    then
        echo "Usage: ./luhn.sh <input>"
    else 
        input=${1// }
        if [[ ${#input} == 1 ]] || [[ ${input} =~ [^0-9] ]]
        then
            echo "false"
        else 
            sum_luhn=$(luhn_sum "${input}")
            luhn_check "${sum_luhn}"
        fi
    fi
}

main "$@"