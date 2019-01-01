#!/usr/bin/env bash
# set -x

silence(){
    if [[ -z "${1}" || $1 =~ ^[[:space:]]+$ ]]
    then
        true
    else 
        false
    fi
}

question(){
    if [[ "${1}" =~ \?$ ]]
    then
        true
    else 
        false
    fi
}

shouting(){
    if [[ "${1}" =~ [[:upper:]] ]] && [[ ! "${msg}" =~ [a-z] ]]
    then
        true
    else
        false
    fi
}

response(){
    msg="${1// }"
    if silence "${msg}"
    then
        echo "Fine. Be that way!"
    elif shouting "${msg}" && question "${msg}" 
    then
        echo "Calm down, I know what I'm doing!"
    elif question "${msg}"
    then
        echo "Sure."
    elif shouting "${msg}"
    then
        echo "Whoa, chill out!"
    else
        echo "Whatever."
    fi
}

main(){
    if [[ "$#" -gt 1 ]]
    then
        echo "Usage: ./bob.sh <message>"
    else
        response "${1}"
    fi
}

main "$@"