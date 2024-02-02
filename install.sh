#!/usr/bin/env zsh


parent_dir=$(dirname "$(readlink -f "$0")")

nvim_cmd="ln -s ${parent_dir}/neovim ~/.config/nvim 2>/dev/null"
echo "Linking neovim config ${nvim_cmd}"
eval "${nvim_cmd}"

alacritty_cmd="ln -s ${parent_dir}/alacritty ~/.config/alacritty 2>/dev/null"
echo "Linking alacritty config ${alacritty_cmd}"
eval "${alacritty_cmd}"

tmux_cmd="ln -s ${parent_dir}/tmux/tmux.conf ~/.tmux.conf 2>/dev/null"
echo "Linking tmux config ${tmux_cmd}"
eval "${tmux_cmd}"

