export XDG_CONFIG_HOME=${HOME}/.config

export STARSHIP_CONFIG=${XDG_CONFIG_HOME}/starship/starship.toml

bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# use starship
eval "$(starship init zsh)"

