# pyenv — only if mise is not handling Python
if (( ! $+commands[mise] )) && (( $+commands[pyenv] )); then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ ":$PATH:" != *":$PYENV_ROOT/bin:"* ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

# python3 → python fallback
if ! python --version &>/dev/null && (( $+commands[python3] )); then
    function python() { python3 "$@"; }
fi

# uv — fast Python package/project manager (replaces pip, pipenv, virtualenv)
if (( $+commands[uv] )); then
    eval "$(uv generate-shell-completion zsh)"
    # Use uv for pip-like operations
    alias pip='uv pip'
    alias venv='uv venv'
fi
