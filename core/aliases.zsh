# Modern CLI replacements (eza, bat, ripgrep, fd, lazygit, dust, procs, sd, xh, doggo)
if (( $+commands[eza] )); then
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -l --icons --group-directories-first --git'
    alias la='eza -la --icons --group-directories-first --git'
    alias tree='eza --tree --icons'
else
    alias ll='ls -l'
fi

(( $+commands[bat] )) && alias cat='bat'
(( $+commands[lazygit] )) && alias lg='lazygit'
(( $+commands[dust] )) && alias du='dust'
(( $+commands[procs] )) && alias ps='procs'
(( $+commands[sd] )) && alias sed='sd'
(( $+commands[xh] )) && alias http='xh'
(( $+commands[doggo] )) && alias dig='doggo'
(( $+commands[btop] )) && alias top='btop'
(( $+commands[difft] )) && alias diff='difft'

# Override OMZ common-aliases fd (find-dirs) with real fd
(( $+commands[fd] )) && unalias fd 2>/dev/null

# General aliases
alias grep='grep --color=auto'

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
