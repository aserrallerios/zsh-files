if (( $+commands[docker] )); then
    alias docker-rmi-none='docker rmi $(docker images --filter "dangling=true" -q)'
    alias docker-rm-all='docker rm -f $(docker ps -aq)'
fi
