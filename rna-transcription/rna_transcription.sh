#!/usr/bin/env bash

rna_validation(){
    declare string=""
    for ((count=0; count<${#1}; count++))
    do
        case ${1:$count:1} in 
            "A")
            string=$string"U"
            ;;
            "C")
            string=$string"G"
            ;;
            "G")
            string=$string"C"
            ;;
            "T")
            string=$string"A"
            ;;
            *)
            string=$string+""
            ;;
        esac
    done
    echo $string
}


main(){
    if [ "$#" -gt 1 ] || [[ $1 =~ [BDEFH-SU-Z]+ ]]
    then 
        echo "Invalid nucleotide detected."
        exit 1
    else
        rna_validation "$1"
    fi
}

main "$@"