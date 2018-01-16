#!/bin/bash

user=$1
vm=$2
ip=$(grep ip roles/deploy-vm/vars/main.yml | tail -n1 | cut -f 6 -d"'" | cut -f 4 -d".")
ssh=$(grep ip roles/deploy-vm/vars/main.yml | tail -n1 | cut -f 8 -d"'")
http=$(grep ip roles/deploy-vm/vars/main.yml | tail -n1 | cut -f 10 -d"'")
https=$(grep ip roles/deploy-vm/vars/main.yml | tail -n1 | cut -f 12 -d"'")
new_http=$(($https+1))
new_https=$(($https+2))
new_ssh=$(($ssh+1))
new_ip=$(($ip+1))
salt=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10  | head -n 1)

printf "  - { \
name: '$user', \
vm: '$vm', \
ip: '10.0.10.$new_ip', \
ssh: '$new_ssh', \
http: '$new_http', \
https: '$new_https' \
}\n" >> roles/deploy-vagrant-vm/vars/main.yml

