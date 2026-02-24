export PATH="$HOME/bin:$PATH"
if type brew &>/dev/null; then
  export PATH="$(brew --prefix python)/libexec/bin:$PATH"
  export PATH="$(brew --prefix)/bin:$PATH"
fi

if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi

eval "$(ssh-agent -s)"
