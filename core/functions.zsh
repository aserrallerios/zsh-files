# Automatically run ls when cd-ing into a directory
cd() {
    builtin cd "$@" && ls
}

# Time ZSH startup
zsh-time() {
    time zsh -i -c exit
}

# Run commands without saving to history
incognito() {
    local editor="${EDITOR:-vim}"
    local tempfile
    tempfile="$(mktemp -t incognito.XXXXXXXX)" || return 1

    "$editor" "$tempfile" || {
        echo "Invalid return on the editing"
        rm -f "$tempfile"
        return 1
    }

    sh "$tempfile"
    rm -f "$tempfile"
}

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}
