# Shell functions

# Make a directory and cd into it
md() {
  test -n "$1" || return
  mkdir -p "$1" && cd "$1"
}

# Show PATH entries one per line, optionally grepping
path() {
  if [ -n "$1" ]; then
    echo "$PATH" | tr ':' '\n' | grep -i "$1"
  else
  echo "$PATH" | tr ':' '\n'
  fi
}

# Universal archive extractor
extract() {
  if [ -f "$1" ]; then
  case "$1" in
      *.tar.bz2) tar xjvf "$1" ;;
      *.tar.gz)  tar xzvf "$1" ;;
      *.tar.xz)  tar xvf "$1" ;;
      *.bz2)     bzip2 -d "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
    *.tar)     tar xf "$1" ;;
    *.tbz2)    tar xjf "$1" ;;
    *.tgz)     tar xzf "$1" ;;
    *.zip)     unzip "$1" ;;
      *.Z)       uncompress "$1" ;;
    *.7z)      7z x "$1" ;;
      *)         echo "'$1' cannot be extracted via extract()" ;;
  esac
  else
    echo "'$1' is not a valid file"
  fi
}
