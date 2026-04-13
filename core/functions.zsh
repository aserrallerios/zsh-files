# Automatically run ls when cd-ing into a directory
cd() {
    builtin cd "$@" && ls
}

# Get external IP
ip-addr() {
    wget -qO- http://ipecho.net/plain
    echo
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

# Extract archives based on extension
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2) tar xvjf "$1" ;;
            *.tar.gz)  tar xvzf "$1" ;;
            *.bz2)     bunzip2 "$1" ;;
            *.rar)     unrar x "$1" ;;
            *.gz)      gunzip "$1" ;;
            *.tar)     tar xvf "$1" ;;
            *.tbz2)    tar xvjf "$1" ;;
            *.tgz)     tar xvzf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.Z)       uncompress "$1" ;;
            *.7z)      7z x "$1" ;;
            *)         echo "'$1' cannot be extracted via extract" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Recompile zsh files
zsh_recompile() {
    autoload -U zrecompile
    rm -f ~/.zsh/*.zwc
    [[ -f ~/.zshrc ]] && zrecompile -p ~/.zshrc
    [[ -f ~/.zshrc.zwc.old ]] && rm -f ~/.zshrc.zwc.old

    for f in ~/.zsh/**/*.zsh; do
        [[ -f "$f" ]] && zrecompile -p "$f"
        [[ -f "$f.zwc.old" ]] && rm -f "$f.zwc.old"
    done

    [[ -f ~/.zcompdump ]] && zrecompile -p ~/.zcompdump
    [[ -f ~/.zcompdump.zwc.old ]] && rm -f ~/.zcompdump.zwc.old

    source ~/.zshrc
}
