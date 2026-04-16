# fzf — fuzzy finder configuration
if (( $+commands[fzf] )); then
    # --- Catppuccin Mocha theme (matches tmux config) ---
    export FZF_DEFAULT_OPTS="
        --height=40%
        --layout=reverse
        --border=rounded
        --info=inline-right
        --prompt='❯ '
        --pointer='▶'
        --marker='✓'
        --bind='ctrl-d:half-page-down,ctrl-u:half-page-up'
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
        --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
        --color=selected-bg:#45475a
    "

    # --- Ctrl-T: Paste selected file path ---
    (( $+commands[fd] )) && export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_OPTS="
        --preview 'bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || cat {}'
        --bind 'ctrl-/:change-preview-window(down|hidden|)'
        --header 'CTRL-/ toggle preview'
    "

    # --- Alt-C: cd into selected directory ---
    (( $+commands[fd] )) && export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    export FZF_ALT_C_OPTS="
        --preview 'eza --tree --color=always --icons --level=2 {} 2>/dev/null || ls -la {}'
    "

    # --- Ctrl-R: History search ---
    export FZF_CTRL_R_OPTS="
        --color header:italic
        --header 'Ctrl-Y to copy command'
        --bind 'ctrl-y:execute-silent(echo -n {2..} | ${CLIPBOARD_COPY:-pbcopy})+abort'
    "

    # --- fzf-tab configuration ---
    # Switch between completion groups with < and >
    zstyle ':fzf-tab:*' switch-group '<' '>'

    # Preview for directories (cd, pushd, rmdir, etc.)
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --color=always --icons --level=2 $realpath 2>/dev/null || ls -la $realpath'
    zstyle ':fzf-tab:complete:(pushd|rmdir):*' fzf-preview 'eza --tree --color=always --icons --level=2 $realpath 2>/dev/null || ls -la $realpath'

    # Preview for file listings
    zstyle ':fzf-tab:complete:(ls|eza):*' fzf-preview 'eza --color=always --icons $realpath 2>/dev/null || ls -la $realpath'

    # Preview for file editors/viewers
    zstyle ':fzf-tab:complete:(cat|bat|less|head|tail|vim|nvim):*' fzf-preview \
        'bat --color=always --style=numbers --line-range=:500 $realpath 2>/dev/null || cat $realpath 2>/dev/null'

    # Preview for environment variables
    zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
        fzf-preview 'echo ${(P)word}'

    # Preview for process operations (kill, ps)
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
        '[[ $group == "[process ID]" ]] && ps -p $word -o pid,user,%cpu,%mem,command 2>/dev/null'
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags '--preview-window=down:4:wrap'

    # Preview for git operations
    zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
        'git diff $word | delta --color-only 2>/dev/null || git diff $word'
    zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
        'git log --oneline --color=always $word 2>/dev/null'
    zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
        'case "$group" in
            "modified file") git diff $word | delta --color-only 2>/dev/null || git diff $word ;;
            *) git log --oneline --color=always $word 2>/dev/null ;;
        esac'

    # Preview for brew
    zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*' fzf-preview \
        'brew info $word 2>/dev/null'

    # Preview for systemctl (Linux)
    zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview \
        'SYSTEMD_COLORS=1 systemctl status $word 2>/dev/null'
fi
