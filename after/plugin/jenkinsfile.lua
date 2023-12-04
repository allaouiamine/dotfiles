local jk = require("jenkinsfile_linter")

vim.keymap.set("n", "<leader>vjk", jk.validate)
