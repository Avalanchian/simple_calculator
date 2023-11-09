#!/usr/bin/env bash

function main() {
    echo "Welcome to the basic calculator!"
    echo "Welcome to the basic calculator!" >> operation_history.txt
    while true; do
        echo "Enter an arithmetic operation or type 'quit' to quit:"
        echo "Enter an arithmetic operation or type 'quit' to quit:"
        read -r -a user_input
        echo "$user_input" >> operation_history.txt
        operator="${user_input[1]}"
        num1="${user_input[0]}"
        num2="${user_input[2]}"
        if [ "$user_input" = "quit" ]; then
            echo "Goodbye!"
            echo "Goodbye!" >> operation_history.txt
            return
        elif [[ ! validate "$user_input" ]]; then
            echo "Operation check failed!"
            echo "Operation check failed!" >> operation_history.txt
            return
        fi
        result=$(echo "scale=2; $num1 $operator $num2" | bc -l)
        echo "$result"
        echo "$result" >> operation_history.txt
    done
}

function validate() {
    re_num='^-?[0-9]+(\.[0-9]+)?$'
    re_operator='^[+,-,*,/,^]$'
    if [ "${#userinput[@]}" -ne 0 ]; then
        return false
    elif [[ ! "$num1" =~ $re_num ]] || [[ ! "$num2" =~ $re_num]] ||[[ ! "$operator" =~ $re_operator ]]; then
        return false
    else
        return true
    fi
}

main
