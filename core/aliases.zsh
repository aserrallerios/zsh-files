# General aliases
alias ll='ls -l'
alias grep='grep --color=auto'
alias rake='noglob rake'
alias bower='noglob bower'

# Rich output aliases
alias psfull="ps auxfe"
alias lsfull="ls -halF"
alias netstatl="netstat -lnptu"
alias lsofil="lsof -i -n | egrep 'COMMAND|LISTEN'"
alias nmap-discover='sudo nmap -PR -sP 192.168.1.0/24'
alias myip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias colorprint='for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"'

# Global aliases
alias -g G=' | grep'
alias -g GI=' | grep -i  '
alias -g L=' | less'
alias -g T=' | tail -20'
alias -g NUL=' > /dev/null 2>&1'
alias -g N=' | /dev/null'
alias -g C=' | wc -l'
alias -g H=' | head'
alias -g S=' | sort'

# Suffix aliases — open by extension
alias -s html='open'
alias -s log='less -MN'
alias -s md="${EDITOR:-nvim}"
alias -s txt="${EDITOR:-nvim}"
