#!/usr/bin/env bash
set -ex

# Install roles into the local `roles/` directory
ansible-galaxy install -r /home/workstation/dotfiles/requirements.yml --roles-path=roles
ansible-galaxy collection install -r /home/workstation/dotfiles/requirements.yml

ansible-playbook -i /home/workstation/dotfiles/hosts.ini main.yml --vv
