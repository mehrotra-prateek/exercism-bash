#!/usr/bin/env bash
# set -x

assert(){
    [[ $(echo "$1" | bc -l) -eq 1 ]]
}

istriangle(){
    if assert "$1 <= 0" || assert "$2 <= 0" || assert "$3 <= 0"
    then
        echo "false"
        exit 0
    fi
    if  assert "$1+$2 <= $3" || assert "$2+$3 <= $1" || assert "$3+$1 <= $2"
    then
        echo "false"
        exit 0
    fi
}

equilateral(){
    if assert "$1 == $2" && assert "$1 == $3"
    then 
        echo "true"
    else   
        echo "false"
    fi
}

isosceles(){
    if assert "$1 == $2" || assert "$1 == $3" || assert "$3 == $2" 
    then 
        echo "true"
    else   
        echo "false"
    fi
}

scalene(){
    if assert "$1 != $2" && assert "$1 != $3" && assert "$3 != $2"
    then 
        echo "true"
    else   
        echo "false"
    fi
}

triangle(){
    istriangle "$2" "$3" "$4"
    case "$1" in
    "equilateral")
        equilateral "$2" "$3" "$4"
        ;;
    "isosceles")
        isosceles "$2" "$3" "$4"
        ;;
    "scalene")
        scalene "$2" "$3" "$4"
        ;;
    *)
        echo "Error: Triangle types supported are"
    ;;
    esac
}

main(){
    if [ "$#" -ne 4 ]
    then
        echo "Usage: triangle.sh <type_of_trianlge> <side1> <side2> <side3>"
        exit 1
    else
        triangle "$1" "$2" "$3" "$4"
    fi
}
main "$@"