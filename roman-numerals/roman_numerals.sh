#!/usr/bin/env bash

convert_roman_num(){
    declare roman_num=""
    case "$2" in 
    4)
        case $1 in
        unit)
            roman_num="IV"
            ;;
        ten)
            roman_num="XL"
            ;;
        hundred)
            roman_num="CD"
            ;;
        esac
        ;;
    9)
        case $1 in
        unit)
            roman_num="IX"
            ;;
        ten)
            roman_num="XC"
            ;;
        hundred)
            roman_num="CM"
            ;;
        esac
        ;;
    [5-8])
        case $1 in
        unit)
            roman_num="V"
            roman_val_post="I"
            ;;
        ten)
            roman_num="L"
            roman_val_post="X"
            ;;
        hundred)
            roman_num="D"
            roman_val_post="C"
            ;;
        esac
        for (( count=5;count<"${2}";count++ ))
        do
            roman_num+="${roman_val_post}"
        done
        ;;
    [1-3])
        case $1 in
        unit)
            roman_val_pre="I"
            ;;
        ten)
            roman_val_pre="X"
            ;;
        hundred)
            roman_val_pre="C"
            ;;
        thousand)
            roman_val_pre="M"
            ;;
        esac
        for (( counter=0;counter<"${2}";counter++ ))
        do
            roman_num+="${roman_val_pre}"
        done
        ;;
    esac   
    echo $roman_num
}

place_value(){
    declare roman_val=""
    for ((placevalue=0; placevalue<${#1}; placevalue++))
    do
        digit=${1:placevalue:1}
        case "${placevalue}" in
        3)
            roman_val+=$(convert_roman_num "unit" "${digit}")
            ;;
        2)
            roman_val+=$(convert_roman_num "ten" "${digit}")
            ;;
        1)
            roman_val+=$(convert_roman_num "hundred" "${digit}")
            ;;
        0)
            roman_val+=$(convert_roman_num "thousand" "${digit}")
            ;;
        esac
    done
    echo "${roman_val}"
}

check_length(){
    case ${#1} in 
    4)
        place_value "${1}"
        ;;
    3)
        place_value "0${1}"
        ;;
    2)
        place_value "00${1}"
        ;;
    1)
        place_value "000${1}"
        ;;
    esac
}

main(){
    if [ "$#" -ne 1 ] || [[ "${1}" -lt 1 || "${1}" -gt 3000 ]]
    then
        echo "Usage: roman_numerals.sh <value> where value is a number between 1 and 3000."
        exit 0
    else
        check_length "${1}"
    fi
}

main "$@"