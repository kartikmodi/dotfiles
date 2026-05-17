# Custom PATH entries
# Note: ~/.local/bin is already added by Fedora's default .bashrc

if [ -d "$HOME/.nix-profile/bin" ]; then
  PATH="$HOME/.nix-profile/bin:$PATH"
fi

if [ -d "$HOME/.venvs/global/bin" ]; then
  PATH="$HOME/.venvs/global/bin:$PATH"
fi

if [ -d "$HOME/.npm-global/bin" ]; then
  PATH="$HOME/.npm-global/bin:$PATH"
fi

# Local bin
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

export PATH
