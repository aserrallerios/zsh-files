export NPM_PACKAGES=$HOME/.npm-packages
export NODE_PATH=$NODE_PATH:$NPM_PACKAGES/lib/node_modules
export PATH=$PATH:$NPM_PACKAGES/bin
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
# export MANPATH=$(manpath):$NPM_PACKAGES/share/man
