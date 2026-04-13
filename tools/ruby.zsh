# Ruby — only configure manually if mise is not handling it
if (( ! $+commands[mise] )); then
    # Add system's ruby gempath to PATH
    if (( $+commands[gem] )); then
        PATH="${$(gem environment gempath)/://bin:}/bin:$PATH"
    fi

    # chruby
    if (( $+commands[chruby] )); then
        chruby system
    fi
fi
