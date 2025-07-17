#!/usr/bin/env bash
set -ex

# NIX_DEBUG=2 
~/.nix-profile/bin/home-manager switch --flake /home/workstation/dotfiles#workstation -b backup --verbose # --show-trace
