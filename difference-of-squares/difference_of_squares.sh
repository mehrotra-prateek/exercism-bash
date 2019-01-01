#!/usr/bin/env bash

square_of_sum(){
    for ((count=1;count<="$1"; count++))
    do
        sum=$((sum + count))
    done
    square=$((sum**2))
    echo "${square}"
}

sum_of_squares(){
    for ((count=1;count<="$1"; count++))
    do
        sum=$((sum + (count ** 2) ))
    done
    echo "${sum}"
}

projecteuler(){
    case "$1" in
    "square_of_sum")
        square_of_sum "$2"
        ;;
    "sum_of_squares")
        sum_of_squares "$2"
        ;;
    "difference")
        echo $(( $(square_of_sum "$2") - $(sum_of_squares "$2") ))
        ;;
    *)
        echo "Error: Function names allowed are square_of_sum OR sum_of_square OR difference"
        exit 1
    ;;
    esac
}

main(){
    if [ "$#" -ne 2 ]
    then
        echo "Usage: difference_of_squares.sh <function> <number>"
        exit 1
    elif [ "$2" -lt 1 ]
    then
        echo "Error: Number has to be more than 1"
        exit 1
    else
        projecteuler "$1" "$2"
    fi
}

main "$@"