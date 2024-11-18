export XDG_CONFIG_HOME=${HOME}/.config
export PATH=${HOME}/bin:${PATH}
export GPG_TTY=$(tty)
export STARSHIP_CONFIG=${XDG_CONFIG_HOME}/starship/starship.toml

bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# use starship
eval "$(starship init zsh)"

. "$HOME/.cargo/env"
. "$HOME/.flamegraph"
. "$HOME/.fzf"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# use autocompletion
autoload -Uz compinit
compinit

source "${HOME}/.zsh_kubectl"


alias kc=kubectl

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory


