alias docker-rmi-none="docker rmi \`docker images | grep none | cut -f1 -d$'\t'\`"
alias docker-rm-all="docker rm -f \`docker ps -a | awk '{print \$1}' | tail -n +2\`"
