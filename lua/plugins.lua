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

  -- Git
  use 'rhysd/git-messenger.vim'
  use{
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end,
  }

  -- Colors
  use{
    'nvim-treesitter/nvim-treesitter',
    config = [[require('config.treesitter')]],
  }
  use{
    'marko-cerovac/material.nvim',
    config = [[require('config.material')]],
  }
end)
