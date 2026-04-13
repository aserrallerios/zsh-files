export PATH="$HOME/bin:$HOME/.bin:$HOME/.local/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin"

# Enable color in grep
export GREP_COLORS='mt=1;33'

export LESS='-rFnXM --ignore-case --raw-control-chars'
export PAGER='less'
(( $+commands[nvim] )) && export EDITOR='nvim'
(( $+commands[bat] )) && export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -l man -p'"

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

export DRIP_SHUTDOWN=30

export WORDCHARS='*?_[]~=&;!#$%^(){}<>'
