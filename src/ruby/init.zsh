# Add system's ruby gempath to PATH
if [ -x "$(command -v gem)" ]; then
  PATH="${$(gem environment gempath)/://bin:}/bin":$PATH
fi

source /usr/share/chruby/chruby.sh
# Default to ruby other than the system ruby
chruby `chruby | tr -d '* '`
