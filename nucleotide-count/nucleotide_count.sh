#!/usr/bin/env bash

nucleotide(){
    string="$*"
    acount=0
    ccount=0
    gcount=0
    tcount=0
    for ((i=0; i <= ${#string}; i++))
    do
        character="${string:$i:1}"
        case "${character}" in
        "A")
            ((acount++))
            ;;
        "C")
            ((ccount++))
            ;;
        "G")
            ((gcount++))
            ;;
        "T")
            ((tcount++))
            ;;
        esac
    done
    echo -e "A: ${acount}\\nC: ${ccount}\\nG: ${gcount}\\nT: ${tcount}"
}

main(){
    if [ "$#" -ne 1 ] || [[ $1 =~ [BDEFH-SU-Z]+ ]]
    then 
        echo "Invalid nucleotide in strand"
        exit 1
    else
        nucleotide "$1"
    fi
}

main "$@"