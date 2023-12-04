return {
  {
    'daschw/leaf.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local leaf_colors = require('leaf.colors').setup()
      require('leaf').setup({
        contrast = 'high',
        overrides = {
          Warning = { fg = leaf_colors.yellow_darker },
          DiffAdd = { bg = leaf_colors.green_darker },
          DiffText = { bg = leaf_colors.yellow_darker },
          DiffChange = { bg = leaf_colors.blue_darker },
          DiffDelete = { bg = leaf_colors.red_darker },
        }
      })
      vim.cmd([[colorscheme leaf]])
    end,
  },
}
