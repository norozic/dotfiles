DOTPATH=~/dotfiles

## Deno
DENO_INSTALL=$HOME/.deno

## Pipenv
export PIPENV_VENV_IN_PROJECT=1

## Cargo
if [ -f $HOME/.cargo/env ]; then
  source $HOME/.cargo/env
fi

## Command alias
alias ls="exa"
alias g="git"
alias tm="tmux new-session \; source-file ~/.tmux.session.conf"

# anyenv
eval "$(anyenv init -)"

# Starship
eval "$(starship init zsh)"

