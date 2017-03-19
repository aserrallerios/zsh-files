# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey "^D"      kill-whole-line                      # ctrl-d instead of ctrl-u
bindkey "^U"      backward-kill-line

bindkey -e   # Default to standard emacs bindings, regardless of editor string