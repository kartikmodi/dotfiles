# History config

HISTCONTROL=ignoredups:erasedups
HISTTIMEFORMAT="%Y-%m-%d %T "
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend

# Flush history after each command so new terminals see it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }history -a"
