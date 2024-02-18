local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
  'rust_analyzer',
  'lua_ls',
  'pyright',
  'groovyls',
  'terraformls',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})


require('mason-tool-installer').setup({
    ensure_installed = {
        'black',
        'isort',
    }
})
