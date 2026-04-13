# Only applies on Linux systems with linuxbrew installed
if [[ -e "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi
