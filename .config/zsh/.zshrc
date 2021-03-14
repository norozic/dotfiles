DOTPATH=~/dotfiles

## Deno
DENO_INSTALL=$HOME/.deno

# Cargo
if [ -f $HOME/.cargo/env ]; then
  source $HOME/.cargo/env
fi

# asdf
source /opt/asdf-vm/asdf.sh

mkdir -p /tmp/$USER-zsh-completions/
if hash rustup 2>/dev/null; then
    rustup completions zsh > /tmp/$USER-zsh-completions/_rustup
fi

fpath=(
    /tmp/$USER-zsh-completions/
    $fpath)

if hash rustc 2>/dev/null; then
    fpath=($(rustc --print sysroot)/share/zsh/site-functions $fpath)
fi

## Command alias
alias ls="exa"
alias vi="nvim"
alias g="git"
alias t="tmuximum"
alias rustcheck="RUSTFLAGS='-D warnings' cargo clippy && cargo fmt --all -- --check && cargo test"

# Use vim keybind
bindkey -v

# Change default editor to Neovim
export EDITOR=nvim

# prompt
export PURE_PROMPT_SYMBOL='%%'

is_i3=$(uname -a | grep arch)

function ghq-fzf() {
  local src=$(ghq list | fzf)
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}

zle -N ghq-fzf
bindkey '^g' ghq-fzf

# direnv
eval "$(direnv hook zsh)"

autoload bashcompinit
bashcompinit

autoload -U compinit
compinit -u

autoload -Uz colors
colors

### Added by Zinit's installer
if [[ ! -f $HOME/.config/zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.config/zsh/.zinit" && command chmod g-rwX "$HOME/.config/zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.config/zsh/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.config/zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# plugins
zinit ice as"program" pick"tmuximum"
zinit load arks22/tmuximum
zinit ice wait'!0'; zinit light sindresorhus/pure
zinit ice wait'!0'; zinit light zsh-users/zsh-autosuggestions
zinit ice wait'!0'; zinit light zsh-users/zsh-completions
zinit ice wait'!0'; zinit light zdharma/fast-syntax-highlighting
zinit ice wait'!0'; zinit light zdharma/history-search-multi-word
zinit ice wait'!0'; zinit light rupa/z

if [ ! $is_i3 ]; then
  if [ -z $TMUX ]; then
    tmuximum
  fi
fi
