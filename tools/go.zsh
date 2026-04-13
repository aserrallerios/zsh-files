# Go — keep GOPATH/bin in PATH (mise or system go both need this)
if (( $+commands[go] )); then
    export GOPATH="${GOPATH:-$HOME/go}"
    export PATH="$PATH:$GOPATH/bin"
fi
