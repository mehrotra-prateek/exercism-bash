#! /usr/bin/env bash

mmi(){
    local -i mmi_val ctr
    for ((ctr=0;ctr<26;ctr++))
    do
        if [[ $(( (ctr * $1) % 26 )) == 1  ]]
        then
            mmi_val=$ctr
        fi
    done
    echo $mmi_val
}

decrypt_code(){
    local -i mmival
    mmival=$(mmi "${1}")
    echo "$(( ( mmival * ($2 - $3) ) % $4 ))"
}

encrypt_code(){
    echo "$(( ( ($1 * $2) + $3 ) % $4 ))"
}

encryption(){
    declare char="" encrypt_code="" cipher_val=""
    declare -i count=0 counter=0
    alphabets="abcdefghijklmnopqrstuvwxyz"
    mod=${#alphabets}
    for (( count=0; count<${#3}; count++))
    do
        char="${3:$count:1}"
        if [[ "${char}" =~ [[:alpha:]] ]]
        then
            for ((counter=0; counter<${#alphabets}; counter++))
            do
                if [[ "${char}" == "${alphabets:$counter:1}" ]]
                then
                    cipher_val=$(${4} "${1}" "${counter}" "${2}" "${mod}")
                    encrypt_code+=${alphabets:cipher_val:1}
                fi
            done
        else
            encrypt_code+=$char
        fi
    done
    echo "${encrypt_code}"
}

crypt(){
    local encrypt="" secret=""
    case "${1}" in
    encode)
        encrypt=$(encryption "${2}" "${3}" "${4}" "encrypt_code")
        if [[ ${#encrypt} -lt 5 ]]
        then
            echo "${encrypt}"
        else
            secret+=${encrypt:0:5}
            for (( cnt=5;cnt<${#encrypt};cnt+=5 ))
            do
                secret+=" ${encrypt:cnt:5}"
            done
            echo "${secret}"
        fi
        ;;
    decode)
        encryption "${2}" "${3}" "${4}" "decrypt_code"
        ;;
    esac
}

convertstr(){
    local str=""
    str=${1,,}
    echo "${str//[^[:alnum:]]/}"
}

coprimeerrormessage(){
    echo "a and m must be coprime."
    exit 1
}

validatecoprime(){
    if [[ $1%2 -eq 0 ]] || [[ $1%13 -eq 0 ]]
    then
        coprimeerrormessage
    fi
}

validateinput(){
    local -i val1=$2
    local -i val2=$3
    if [ -n "${val1//[0-9]/}" ] || [ -n "${val2//[0-9]/}" ] || [ "${1}" != "encode" ] && [ "${1}" != "decode" ]
    then
        inputerrormessage
    fi
}

inputerrormessage(){
    echo "Usage: affine_cipher.sh encode/decode '<numeric_value1>' '<numeric_value2>' '<word_to_encode>'"
    exit 1
}

main(){
    local inputstring=""
    if [ "$#" -ne 4 ]
    then
        inputerrormessage
    else
        validateinput "${1}" "${2}" "${3}" "${4}"
        validatecoprime "${2}"
        inputstring=$(convertstr "${4}") 
        crypt "${1}" "${2}" "${3}" "${inputstring}" 
    fi
}

main "$@"