# Aliases

# Navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias back='cd $OLDPWD'
alias c='clear'

# File operations (safety nets)
alias cp='cp -iv'
alias mv='mv -iv'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias mkdir='mkdir -pv'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Listing
alias ls='ls -lhF --time-style=long-iso --color=auto'
alias ll='ls -ltrh'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -lhFa --time-style=long-iso --color=auto'

# Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Editors
alias e='vim -O'
alias E='vim -o'
alias svim='sudo vim'

# System info
alias df='df -h -x squashfs -x tmpfs -x devtmpfs'
alias ports='netstat -tulanp'
alias ports2='ss -tulnp'
alias lsmount='mount | column -t'
alias extip='curl -s icanhazip.com'
alias weather='curl -s wttr.in'

# Top processes by memory/cpu, biggest dirs
alias topmem='ps aux --sort=-%mem | head -10'
alias topcpu='ps aux --sort=-%cpu | head -10'
alias bigdirs='du -cksh * | sort -hr | head -10'

# Session
alias h='history'
alias j='jobs -l'
alias reload='source ~/.bashrc'

# Tools
alias diff='colordiff'
alias watch='watch -d'
alias wget='wget -c'
alias ssha='eval $(ssh-agent) && ssh-add'

# Tmux
alias tn='tmux new -s'

# Proxmox
alias pve='ssh root@virt.modi.local pvesh'

# Package management
if [ -f /usr/bin/dnf ]; then
  alias update='sudo dnf check-update'
  alias upgrade='sudo dnf upgrade --refresh'
  alias install='sudo dnf install'
elif [ -f /usr/bin/apt ]; then
  alias update='sudo apt update'
  alias upgrade='sudo apt update && sudo apt dist-upgrade && sudo apt autoremove && sudo apt clean'
  alias install='sudo apt install'
fi
