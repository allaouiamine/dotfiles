
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

  -- python tools
  use ('jose-elias-alvarez/null-ls.nvim')

  -- Debugging
  use ('nvim-lua/plenary.nvim')
  use ('mfussenegger/nvim-dap')

  -- tmux integration
  use ('christoomey/vim-tmux-navigator')

  -- Jenkinsfile
  --use({'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" }, ft = {'Jenkinsfile'} })


 use({'folke/noice.nvim',
    requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
 })


  use {
  'vonheikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
      		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
          {'WhoIsSethDaniel/mason-tool-installer.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
  }
  }

  -- AI Stuff
  -- Copilot
  --use('github/copilot.vim')

  -- chatGPT
  --use({
  --    "jackMort/ChatGPT.nvim",
  --    requires = {
  --        "MunifTanjim/nui.nvim",
  --        "nvim-lua/plenary.nvim",
  --        "folke/trouble.nvim",
  --        "nvim-telescope/telescope.nvim"
  --    }
  --})
  use({"David-Kunz/gen.nvim"})

end)
