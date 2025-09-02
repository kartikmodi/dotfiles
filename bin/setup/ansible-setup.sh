#!/usr/bin/env bash
set -ex

ansible-galaxy install -r /home/workstation/dotfiles/requirements.yml

ansible-galaxy collection install -r /home/workstation/dotfiles/requirements.yml
