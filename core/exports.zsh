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

# Cross-platform clipboard command
if (( $+commands[pbcopy] )); then
    export CLIPBOARD_COPY='pbcopy'
elif (( $+commands[wl-copy] )); then
    export CLIPBOARD_COPY='wl-copy'
elif (( $+commands[xclip] )); then
    export CLIPBOARD_COPY='xclip -selection clipboard'
elif (( $+commands[xsel] )); then
    export CLIPBOARD_COPY='xsel --clipboard --input'
fi
