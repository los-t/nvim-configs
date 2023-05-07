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
        }
      })
      vim.cmd([[colorscheme leaf]])
    end,
  },
}
