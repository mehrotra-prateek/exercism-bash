#!/usr/bin/env bash
# set -x

arrayofwords(){
    declare -a arrayofwords=() arrayofuniquewords=()
    for word in ${1//[^\'a-z0-9]/ }
    do  
        if [[ ${word:0:1} == \' ]]
        then
            word=${word//[\']/}
        fi
        arrayofwords+=( "${word}" )
    done
    for (( count=0; count<"${#arrayofwords[@]}"; count++ ))
    do
        checkstring=${arrayofwords[count]}
        isunique=true
        for (( counter=0; counter<"${#arrayofuniquewords[@]}"; counter++ ))
        do
            if [[ $checkstring == "${arrayofuniquewords[counter]}" ]]
            then
                isunique=false
            fi
        done
        if [[ ${isunique} == true ]]
        then
            arrayofuniquewords+=( "${checkstring}" )
        fi
    done

    for (( count=0;count<${#arrayofuniquewords[@]};count++))
    do
        word=${arrayofuniquewords[count]}
        declare -a wordcount=()
        for (( counter=0;counter<${#arrayofwords[@]};counter++ ))
        do
            if [[ $word == "${arrayofwords[counter]}" ]]
            then
                wordcount+=( "$word" )
            fi
        done
        echo "${word}: ${#wordcount[@]}"
    done
}

main(){
    if [[ "$#" -ne 1 ]]
    then
        echo "Usage: sh word_count.sh <phrase of word(s)>"
        exit 1
    else    
        arrayofwords "${1,,}"
    fi
}

main "$@"