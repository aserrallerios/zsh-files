# Lazy-load jenv to avoid ~50ms penalty on every shell start
if (( $+commands[jenv] )); then
    jenv() {
        unfunction jenv
        eval "$(command jenv init -)"
        jenv "$@"
    }
fi
