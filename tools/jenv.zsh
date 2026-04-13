# jenv — only if mise is not handling Java
if (( ! $+commands[mise] )) && (( $+commands[jenv] )); then
    jenv() {
        unfunction jenv
        eval "$(command jenv init -)"
        jenv "$@"
    }
fi
