#!/usr/bin/env bash

main() {
    echo "One for ${*-you}, one for me."
}

main "$@"