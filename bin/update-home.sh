#!/usr/bin/env bash
set -ex

# NIX_DEBUG=2 
# ~/.nix-profile/bin/home-manager switch --flake /home/workstation/dotfiles#amd64 -b backup --verbose # --show-trace
~/.nix-profile/bin/home-manager switch --flake /home/workstation/dotfiles#aarch64 -b backup --verbose # --show-trace
#nix run home-manager -- switch --flake .#workstation
#nix run .#homeConfigurations.workstation.activationPackage
