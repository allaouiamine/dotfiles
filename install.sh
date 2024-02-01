#!/usr/bin/env zsh


parent_dir=$(dirname "$(readlink -f "$0")")

ln -s ${parent_dir}/neovim ~/.config/nvim 2>/dev/null
ln -s ${parent_dir}/dotfiles/alacritty ~/.config/alacritty 2>/dev/null
ln -s ${parent_dir}/dotfiles/tmux/tmux.conf ~/.tmux.conf 2>/dev/null
