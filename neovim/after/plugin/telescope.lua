local telescope = require('telescope')
local builtin = require('telescope.builtin')
telescope.setup{ defaults = {file_ignore_patterns = {}, }}
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
