#!/usr/bin/env bash

convert_to_roman(){
    local number=$1
    local roman_value=""
    declare -a romanIdentifier=([1000]="M" [900]="CM" [500]="D" [100]="C" [90]="XC"
                        [50]="L" [40]="XL" [10]="X" [9]="IX" [5]="V" [4]="IV"
                        [1]="I" [400]="CD")

    declare -a placevalue=(1000 900 500 400 100 90 50 40 10 9 5 4 1)                       

    while [ "${number}" -ne 0 ]; do
        val=0

        for num in ${placevalue[*]}; do
            (( "${num}" <= "${number}" )) && { val=${num} ; break ; }
        done

        roman_value+=${romanIdentifier[$val]}
        ((number-=val))
    done
    echo "${roman_value}"
}

main(){
    if [ "$#" -ne 1 ] || [[ "${1}" -lt 1 || "${1}" -gt 3000 ]]
    then
        echo "Usage: roman_numerals.sh <value> where value is a number between 1 and 3000."
        exit 0
    else
        convert_to_roman "${1}"
    fi
}

main "$@"