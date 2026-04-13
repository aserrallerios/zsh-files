export PATH="$HOME/bin:$HOME/.bin:$HOME/.local/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin"

# Setup terminal, and turn on colors
export TERM=xterm-256color

# Enable color in grep
export GREP_COLOR='1;33'

export LESS='-rFnXM --ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='nvim'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

export DRIP_SHUTDOWN=30

export WORDCHARS='*?_[]~=&;!#$%^(){}<>'
