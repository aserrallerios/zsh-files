# Add system's ruby gempath to PATH
if [ -x "$(command -v gem)" ]; then
  PATH="${$(gem environment gempath)/://bin:}/bin":$PATH
fi
