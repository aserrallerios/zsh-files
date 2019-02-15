# Yes, really
export PATH=~/bin:$PATH
export PATH=~/.bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=$PATH:/sbin:/usr/sbin

# Setup terminal, and turn on colors
export TERM=xterm-256color
# export TERM=screen-256color       # for a tmux -2 session (also for screen)
# export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session

# Enable color in grep
export GREP_COLOR='1;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='-rFnXM --ignore-case --raw-control-chars'
# export PAGER='most'
export PAGER='less'
export EDITOR='nvim'
# export VEDITOR='code'
export VEDITOR='subl'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

export DRIP_SHUTDOWN=30
