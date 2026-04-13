# Add system's ruby gempath to PATH
if (( $+commands[gem] )); then
    PATH="${$(gem environment gempath)/://bin:}/bin:$PATH"
fi

# chruby
if (( $+commands[chruby] )); then
    chruby system
fi
