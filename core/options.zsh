# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt AUTO_CD

# Completion
setopt COMPLETE_IN_WORD  # Allow completion from within a word/phrase
setopt ALWAYS_TO_END     # Move cursor to end of word on completion

# Prompt
setopt PROMPT_SUBST      # Enable parameter expansion in prompts

# Menu completion
unsetopt MENU_COMPLETE
setopt AUTO_MENU
