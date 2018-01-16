#!/bin/bash

user=$1
port=$(grep port roles/config/vars/main.yml | tail -n1 | cut -f 4 -d"'")
new_port=$(($port+1))
salt=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10  | head -n 1)

printf "passwd: \n"
read -r -s response
hash=$(python -c 'import crypt; print crypt.crypt("'$response'", "$6$'$salt'")')
printf "  - { \
user: '$user', \
port: '$new_port', \
shadow: '$hash', \
id: '2301' \
}\n" >> roles/config/vars/main.yml
