require("chatgpt").setup({
    api_key_cmd = "gpg --decrypt " .. vim.fn.expand("$HOME")  .. "/secret/chatgpt"
})
