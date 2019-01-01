#!/usr/bin/env bash

predictive_date(){
    
    if [ ${#1} -eq 11 ]
    then
        input_date="${1:0:10} 00:00:00Z"
    else
        input_date="$1"
    fi
    input_date_in_epoch=$(date -ju -f '%Y-%m-%d %H:%M:%SZ' "${input_date}" '+%s')
    future_date_in_epoch="$(("${input_date_in_epoch}" + (10**9) ))"
    date -ju -r "${future_date_in_epoch}" '+%a %b %-d %H:%M:%S UTC %Y'
}

validate_timezone(){
    input_date="$1"
    timezone=${input_date:${#input_date}-1:1}
    if [  "${timezone}" != Z ]
    then
    echo "Error: Timezone has to be UTC"
    else
    predictive_date "$1"
    fi
}

main(){
    if [ "$#" -ne 1 ]
    then
        echo "Usage: gigasecond.sh <date time>"
    else
        validate_timezone "$1"
    fi
}

main "$@"