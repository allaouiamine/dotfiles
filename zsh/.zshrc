export XDG_CONFIG_HOME=${HOME}/.config

export STARSHIP_CONFIG=${XDG_CONFIG_HOME}/starship/starship.toml

bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# use starship
eval "$(starship init zsh)"

. "$HOME/.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"
