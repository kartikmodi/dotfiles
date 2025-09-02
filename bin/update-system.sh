#!/usr/bin/env bash
set -ex

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 machine/machine groups"
    echo "Example: $0 laptops,nvr1,virt"
    exit 1
fi

# Run ansible playbook
ansible-playbook -i /home/workstation/dotfiles/hosts.ini main.yml --verbose --ask-pass --limit "$1"
