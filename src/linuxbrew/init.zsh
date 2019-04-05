# This will only apply in linux systems that have brew installed
if [ -e "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi
