-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Claude Code writes its clipboard with OSC 52, and when $TMUX is set it also
-- emits a tmux DCS passthrough copy of it (\ePtmux;...\e\\). Neovim's :terminal
-- does not parse that wrapper, so the base64 payload is printed into the buffer
-- on every copy and stays there. Launching it without $TMUX keeps the plain
-- OSC 52 (which :terminal does consume) plus pbcopy, so copying still works.
vim.api.nvim_create_user_command("Claude", function(opts)
  vim.cmd("terminal env -u TMUX claude " .. opts.args)
end, { nargs = "*", desc = "claude, with $TMUX stripped (no OSC 52 leak in :terminal)" })
