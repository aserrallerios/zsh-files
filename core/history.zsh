# Command history configuration
if [[ -z "$HISTFILE" ]]; then
    HISTFILE="$HOME/.zsh_history"
fi
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY       # Include timestamps in history
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first when trimming
setopt HIST_IGNORE_DUPS       # Do not write duplicate events
setopt HIST_FIND_NO_DUPS      # Don't display results already cycled through
setopt HIST_IGNORE_SPACE      # Ignore commands starting with space
setopt HIST_REDUCE_BLANKS     # Remove extra blanks from commands
setopt HIST_VERIFY            # Show command with history expansion before running
setopt APPEND_HISTORY         # Allow multiple terminals to append
setopt INC_APPEND_HISTORY     # Add commands as they are typed
setopt NO_SHARE_HISTORY       # Don't share history between sessions
