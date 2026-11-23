-- ~/.config/nvim/lua/plugins/protobuf.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        buf_ls = {},
      },
    },
  },
}
