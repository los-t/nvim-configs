return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use{
    'jeetsukumaran/vim-filebeagle',
    config=[[require('config.filebeagle')]],
  }

  use{
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
    }
  }

  -- Lang
  use 'ray-x/lsp_signature.nvim'
  use{
    'neovim/nvim-lsp',
    config=[[require('config.lsp')]],
  }
  use{
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config=[[require('config.completion')]],
  }
  use 'xevz/vim-squirrel'
  use 'beyondmarc/hlsl.vim'
  use 'CaffeineViking/vim-glsl'
  use{
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end,
  }

  -- Debugging
  use{
    'mfussenegger/nvim-dap',
    config=[[require('config.nvim-dap')]],
  }
  use{
    'theHamsta/nvim-dap-virtual-text',
    config = function() require('nvim-dap-virtual-text').setup() end,
    requires = {"mfussenegger/nvim-dap"},
  }
  use{
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = function() require('dapui').setup() end,
  }

  -- Git
  use{
    'rhysd/git-messenger.vim',
    config = [[require('config.gitmessenger')]],
  }
  use{
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end,
  }
  use 'tpope/vim-fugitive'

  -- Colors
  use{
    'nvim-treesitter/nvim-treesitter',
    config = [[require('config.treesitter')]],
  }
  use{
    'rebelot/kanagawa.nvim',
    config = function() vim.cmd('colorscheme kanagawa-dragon') end,
  }
end)
