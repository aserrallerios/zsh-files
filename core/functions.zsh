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

# Cross-platform clipboard pipe: echo foo | clip
clip() {
    if [[ -z "$CLIPBOARD_COPY" ]]; then
        echo "No clipboard tool found (pbcopy, wl-copy, xclip, xsel)" >&2
        return 1
    fi
    eval "$CLIPBOARD_COPY"
}

# Browse aliases interactively with fzf
aliases() {
    alias | fzf --prompt='alias❯ ' \
        --header 'Enter to copy to clipboard' \
        --bind "enter:execute-silent(echo {} | sed \"s/=.*//\" | tr -d \"\\n\" | ${CLIPBOARD_COPY:-pbcopy})+abort"
}
