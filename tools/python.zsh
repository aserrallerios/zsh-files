# pyenv
if (( $+commands[pyenv] )); then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ ":$PATH:" != *":$PYENV_ROOT/bin:"* ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

# python3 → python fallback
if ! python --version &>/dev/null && (( $+commands[python3] )); then
    function python() { python3 "$@"; }
fi

if (( $+commands[pip] )) || (( $+commands[pip3] )); then
    alias pip-update-all="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"
fi
