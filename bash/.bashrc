# bash completions for homebrew packages
# Credit: homebrew website
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export TERM=xterm-256color

if type direnv &>/dev/null ; then
  eval "$(direnv hook bash)"
fi

if type starship &>/dev/null ; then
eval "$(starship init bash)"
fi

set -o vi

alias c="clear && [ $TMUX ] && tmux clear-history"

if [ -f "$HOME/Tools/.bashrc" ]; then
  source $HOME/Tools/.bashrc
fi
