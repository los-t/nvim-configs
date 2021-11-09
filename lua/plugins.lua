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
	use{
    'neovim/nvim-lsp',
    config=[[require('config.lsp')]],
  }
	use{
    'hrsh7th/nvim-compe',
    config=[[require('config.completion')]],
  }
	use 'xevz/vim-squirrel'
	use 'beyondmarc/hlsl.vim'
	use 'CaffeineViking/vim-glsl'

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
