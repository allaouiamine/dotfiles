return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            env = { GOOS = "linux" },
          },
        },
      },
    },
  },
}
