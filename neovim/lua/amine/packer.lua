
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
	  'folke/tokyonight.nvim',
	  as = 'tokyonight',
	  config = function()
		  vim.cmd('colorscheme tokyonight-storm')
	  end
  })

  use ('nvim-treesitter/nvim-treesitter', {run = ':tsupdate'})
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use ('theprimeagen/vim-be-good')

  use ('mfussenegger/nvim-ansible')
  -- Rust tools
  use ('neovim/nvim-lspconfig')
  use ('simrat39/rust-tools.nvim')
  use ('rust-lang/rust.vim')

  -- Debugging
  use ('nvim-lua/plenary.nvim')
  use ('mfussenegger/nvim-dap')

  -- Jenkinsfile
  use({'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" }, ft = {'Jenkinsfile'} })

  -- Obsidian
  use({
  "epwalsh/obsidian.nvim",
  tag = "*",  -- recommended, use latest release instead of latest commit
  requires = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "amine-notes",
          path = "~/work/code/obsidian/amine-notes",
        },
      },

      -- see below for full list of options 👇
    })
  end,
})


  use {
  'vonheikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- lsp support
    {'neovim/nvim-lspconfig'},             -- required
    {'williamboman/mason.nvim'},           -- optional
    {'williamboman/mason-lspconfig.nvim'}, -- optional

    -- autocompletion
    {'hrsh7th/nvim-cmp'},     -- required
    {'hrsh7th/cmp-nvim-lsp'}, -- required
    {'l3mon4d3/luasnip'},     -- required
  }
  }

  -- AI Stuff
  -- Copilot
    use('github/copilot.vim')

  -- chatGPT
  use({
      "jackMort/ChatGPT.nvim",
      config = function()
          require("chatgpt").setup({
              api_key_cmd = "gpg --decrypt " .. vim.fn.expand("$HOME")  .. "/secret/chatgpt"
          })
      end,
      requires = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "folke/trouble.nvim",
          "nvim-telescope/telescope.nvim"
      }
  })

end)
