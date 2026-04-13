if (( $+commands[npm] )); then
    export NPM_PACKAGES="$HOME/.npm-packages"
    export NODE_PATH="${NODE_PATH:+$NODE_PATH:}$NPM_PACKAGES/lib/node_modules"
    export PATH="$PATH:$NPM_PACKAGES/bin"
fi
