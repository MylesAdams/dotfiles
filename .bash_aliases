workspace() {
    cd ~/Documents/workspace/$1
}

# Emacs
alias emacs='emacsclient -t'
alias e='emacsclient -t'
alias se='sudo emacs -nw'

# Directory movement
alias ws='workspace'
alias ucsb='cd ~/Documents/UCSB'

# SSH
alias droplet='ssh myles@206.189.162.148'

# Git
alias gs='git status'
alias ga='git add'
alias gaa='git add *'
alias gcm='git commit -m'
alias gp='git push'
alias gpom='git push origin master'

# Useful changes to commands
alias cp='cp -r'
alias diff='colordiff'

# Useful new commands
alias myip='curl http://ifconfig.me/ip'
