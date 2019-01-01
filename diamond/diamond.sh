#!/usr/bin/env bash

print_space(){
    num=$1
    printf "%-${num}s"
}

print_line(){
    width=$1
    count=$2
    space=$(( width - count ))
    print_space $space
    if [ "$count" -eq "0" ]; then
        echo -ne "${3^^}"
    else
        echo -ne "${3^^}"
        print_space $((2 * count - 1))
        echo -ne "${3^^}"
    fi
    print_space $space
    echo ""
}

char_set(){
    alphabets="abcdefghijklmnopqrstuvwxyz"
    for (( count=0;count<=$1;count++ ))
    do
        chars=${chars}${alphabets:count:1}
    done
    echo "${chars}"
}

char_position(){
    alphabets="abcdefghijklmnopqrstuvwxyz"
    for (( count=0; count<${#alphabets}; count++ ))
    do 
        if [[ $1 == "${alphabets:count:1}" ]]
        then
            position=$count
        fi
    done
    echo $position
}

main(){
    if [[ "$#" -ne 1 ]] || [[ ${#1} != 1 ]]
    then
        echo "Usage: ./diamond.sh <input letter>"
    else
        position=$(char_position "${1,,}")
        set=$(char_set "$position")
        for (( count=0;count<${#set};count++ ))
        do
            print_line "$position" $count "${set:$count:1}"
        done
    fi
    val=$(( position - 1 ))   
    if [[ $val -ge 0 ]]
    then
        for (( count=val;count>=0;count-- ))
        do
            print_line "$position" $count "${set:$count:1}"
        done
    fi
}

main "$@"