# PATH entries

# if [ -d "$HOME/.nix-profile/bin" ]; then
#   PATH="$HOME/.nix-profile/bin:$PATH"
# fi

if [ -d "$HOME/.venvs/global/bin" ]; then
    PATH="$HOME/.venvs/global/bin:$PATH"
fi

# if [ ! -d ${homeDir}/.npm-global ]; then
#       mkdir -p ${homeDir}/.npm-global
#     fi
# if [ -d "$HOME/.npm-global/bin" ]; then
#   PATH="$HOME/.npm-global/bin:$PATH"
# fi

export PATH
#
